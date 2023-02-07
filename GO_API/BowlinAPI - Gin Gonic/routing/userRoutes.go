package routing

import (
	"awesomeProject/model"
	"github.com/gin-gonic/gin"
	_ "github.com/santosh/gingo/docs"
)

type User = model.User

// getUsers responds with the list of all users as JSON.
// getUsers             godoc
// @Summary      Get users array
// @Description  Responds with the list of all users as JSON.
// @Tags         user
// @Produce      json
// @Success      200  {array}  model.User
// @Router       /users [get]
func getUsers(c *gin.Context) {
	var users []User
	model.Db.Find(&users)
	c.JSON(200, users)
}

// getUser responds with the user whose ID value matches the id as JSON.
// getUser             godoc
// @Summary      Get user by id
// @Description  responds with the user whose ID value matches the id as JSON.
// @Tags         user
// @Produce      json
// @Param        id  path      string  true  "search user by id"
// @Success      200  {array}  model.User
// @Router       /users/:id [get]
func getUser(c *gin.Context) {
	var user User
	model.Db.First(&user, c.Param("id"))
	c.JSON(200, user)
}

// postUser takes a user JSON and store in DB.
// postUser             godoc
// @Summary      Store a new user
// @Description  Takes a user JSON and store in DB. Return saved JSON.
// @Tags         user
// @Produce      json
// @Param        user  body      model.User  true  "User JSON"
// @Success      201   {object}  model.User
// @Router       /users [post]
func postUser(c *gin.Context) {
	var user User
	c.BindJSON(&user)
	println(user.Name)
	model.Db.Create(&user)
	c.JSON(201, user)
}

// putUser takes a user JSON and updates user whose ID value matches id.
// putUser             godoc
// @Summary      Update a user
// @Description  takes a user JSON and updates user whose ID value matches id.
// @Tags         user
// @Produce      json
// @Param        id  path      string  true  "search user by id"
// @Param        user  body      model.User  true  "User JSON"
// @Success      200  {object}  model.User
// @Router       /users/:id [put]
func putUser(c *gin.Context) {
	var user User
	model.Db.First(&user, c.Param("id"))
	c.BindJSON(&user)
	model.Db.Save(&user)
	c.JSON(200, user)
}

// deleteUser delete user whose ID value matches id.
// deleteUser             godoc
// @Summary      Delete a user
// @Description  delete user whose ID value matches id.
// @Tags         user
// @Produce      json
// @Param        id  path      string  true  "delete user by id"
// @Success      200  string   "User successfully deleted"
// @Router       /users/:id [delete]
func deleteUser(c *gin.Context) {
	var user User
	model.Db.First(&user, c.Param("id"))
	model.Db.Delete(&user)
	c.JSON(200, gin.H{"message": "User successfully deleted"})
}

func SetUserRoutes() {
	model.App.GET("/users", getUsers)
	model.App.GET("/users/:id", getUser)
	model.App.POST("/users", postUser)
	model.App.PUT("/users/:id", putUser)
	model.App.DELETE("/users/:id", deleteUser)
}
