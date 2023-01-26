package main

import (
	"awesomeProject/model"
	"awesomeProject/routing"
	"fmt"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	_ "github.com/santosh/gingo/docs"
	swaggerFiles "github.com/swaggo/files"
	"github.com/swaggo/gin-swagger"
)

// Model for our User

// @title           Bowl'in API
// @version         1.0
// @description     A bowling scorer API. More infos on [https://codefirst.iut.uca.fr/git/BowlDev/Bowl_in]

// @contact.name   VALIN Arthur
// @contact.email  arthur.valin@etu.uca.fr

// @host      localhost:8080
// @BasePath  /
func main() {

	model.InitializeDatabase()
	model.InitializeApp()

	var url = ginSwagger.URL("/docs")
	model.App.GET("/swagger/*any", ginSwagger.WrapHandler(
		swaggerFiles.Handler, url))
	model.App.StaticFile("/docs", "./docs/swagger.json")

	routing.SetUserRoutes()

	fmt.Println("Server running ! ")
	model.Err = model.App.RunTLS("localhost:8080", "https/cert.pem", "https/privkey.pem")
	if model.Err != nil {
		return
	}
	defer model.Db.Close()

}
