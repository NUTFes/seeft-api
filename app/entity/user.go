package entity

import "time"

type User struct {
	ID        int    `gorm:"primary_key"`
	Name      string `gorm:"size:128"`
	Mail      string `gorm:"size:128"`
	CreatedAt time.Time
	UpdatedAt time.Time
}
