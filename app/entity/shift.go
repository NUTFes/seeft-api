package entity

import "time"

type Shift struct {
	ID         int    `gorm:"primary_key"`
	UserID     int    `gorm:"size:128"`
	Date       string `gorm:"size:128"`
	Time       string `gorm:"size:128"`
	WorkID     int    `gorm:"size:128"`
	Weather    string `gorm:"size:128"`
	Attendance bool   `gorm:"size:128"`
	CreatedAt  time.Time
	UpdatedAt  time.Time
}
