package main

import (
	"awesomeProject/model"
	"awesomeProject/routing"
	"fmt"
	"github.com/iris-contrib/swagger/v12"
	"github.com/iris-contrib/swagger/v12/swaggerFiles"
	_ "github.com/jinzhu/gorm/dialects/postgres"
	"github.com/kataras/iris/v12"
	_ "github.com/santosh/gingo/docs"
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

	config := swagger.Config{
		URL:         "/docs/swagger.json",
		DeepLinking: true,
	}
	swaggerUI := swagger.CustomWrapHandler(&config, swaggerFiles.Handler)
	model.App.Get("/swagger/*any", swaggerUI)
	model.App.HandleDir("/docs", "./docs")

	routing.SetUserRoutes()

	fmt.Println("Server running ! ")
	model.Err = model.App.Run(iris.TLS("localhost:8080", "https/cert.pem", "https/privkey.pem"))
	if model.Err != nil {
		return
	}

}
