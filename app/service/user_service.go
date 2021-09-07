package service

import (
	"fmt"
	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/entity"
)

type UserService struct{}

type User entity.User

type UserParams struct {
	id   int
	name string
}

func (s UserService) All() ([]User, error) {
	db := db.GetDB()

	var user []User

	if err := db.Take(&user).Error; err != nil {
		return nil, err
	}

	tx := db
	tx = tx.Find(&user)

	return user, nil
}

func (s UserService) FindByID(id int) (*User, error) {
	db := db.GetDB()

	var user User

	param := UserParams{id, ""}

	if err := db.Take(&user).Error; err != nil {
		return nil, err
	}

	tx := db

	if param.id != 0 {
		tx = tx.Where("id = ?", 1).Find(&user)
	}

	fmt.Println(&user)

	return &user, nil
}
