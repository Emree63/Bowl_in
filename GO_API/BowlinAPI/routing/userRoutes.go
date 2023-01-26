package routing

import (
	"awesomeProject/model"
	"github.com/kataras/iris/v12"
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
func getUsers(c iris.Context) {
	var users []User
	model.Db.Find(&users)
	c.JSON(users)
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
func getUser(c iris.Context) {
	var user User
	model.Db.First(&user, c.Params().Get("id"))
	c.JSON(user)
}

// postUser takes a user JSON and store in DB.
// postUser             godoc
// @Summary      Store a new user
// @Description  Takes a user JSON and store in DB. Return saved JSON.
// @Tags         user
// @Produce      json
// @Param        user  body      model.User  true  "User JSON"
// @Success      200   {object}  model.User
// @Router       /users [post]
func postUser(c iris.Context) {
	var user User
	c.ReadJSON(&user)
	model.Db.Create(&user)
	c.JSON(user)
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
func putUser(c iris.Context) {
	var user User
	model.Db.First(&user, c.Params().Get("id"))
	c.ReadJSON(&user)
	model.Db.Save(&user)
	c.JSON(user)
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
func deleteUser(c iris.Context) {
	var user User
	model.Db.First(&user, c.Params().Get("id"))
	model.Db.Delete(&user)
	c.JSON(iris.Map{"message": "User successfully deleted"})
}

func SetUserRoutes() {
	model.App.Get("/users", getUsers)
	model.App.Get("/users/:id", getUser)
	model.App.Post("/users", postUser)
	model.App.Put("/users/:id", putUser)
	model.App.Delete("/users/:id", deleteUser)
}
