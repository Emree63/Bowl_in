package model

import (
	"github.com/kataras/iris/v12"
)

var App *iris.Application

func InitializeApp() {
	App = iris.New()
}
