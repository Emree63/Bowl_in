package model

import (
	"github.com/gin-gonic/gin"
)

var App *gin.Engine

func InitializeApp() {
	App = gin.Default()
}
