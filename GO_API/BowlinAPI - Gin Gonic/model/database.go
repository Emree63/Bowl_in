package model

import (
	"github.com/jinzhu/gorm"
	"log"
)

var Db *gorm.DB
var Err error

func InitializeDatabase() {
	Db, Err = gorm.Open("postgres", "host=localhost port=5433 user=bowlin_team dbname=bowlin password=bowlin")
	if Err != nil {
		log.Fatal(Err)
	}
	// Automatically create the "users" table based on the User model
	Db.AutoMigrate(&User{})
}
