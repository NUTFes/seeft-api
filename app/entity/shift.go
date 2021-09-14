package entity

import "time"

type Shift struct {
	ID        int    `gorm:"primary_key"`
	UserID    string `gorm:"size:128"`
	Time      string `gorm:"size:128"`
	Work      string `gorm:"size:128"`
	Weather   string `gorm:"size:128"`
	CreatedAt time.Time
	UpdatedAt time.Time
}
