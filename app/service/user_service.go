package service

import (
	"fmt"
	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/entity"
)

type UserService struct{}

type User entity.User

func (s UserService) GetAll() ([]User, error) {
	db := db.GetDB()

	var user []User

	if err := db.Take(&user).Error; err != nil {
		return nil, err
	}

	tx := db
	tx = tx.Find(&user)

	if &user == nil {
		return nil, fmt.Errorf("this user does not exist.")
	}

	return user, nil
}

func (s UserService) FindByID(id int) (*User, error) {
	db := db.GetDB()

	var user []User

	if err := db.Take(&user).Error; err != nil {
		return nil, err
	}

	if id == 0 {
		return nil, fmt.Errorf("query not found.")
	}

	if err := db.Table("users").Where("id = ?", id).First(&user).Error; err != nil {
		return nil, fmt.Errorf("%w", err)
	}

	fmt.Println(user)

	return &user[0], nil
}

func (s UserService) FindByMail(mail string) (*User, error) {
	db := db.GetDB()

	var user []User

	if err := db.Take(&user).Error; err != nil {
		return nil, err
	}

	tx := db

	if mail != "" {
		tx = tx.Where("mail = ?", mail).First(&user)
	}

	fmt.Println(user)

	return &user[0], nil
}
