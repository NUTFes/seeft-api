package entity

import "time"

type Work struct {
	ID        int    `gorm:"primary_key"`
	Name      string `gorm:"size:128"`
	URL       string `gorm:"size:128"`
	Place     string
	President string
	TEL       string
	CreatedAt time.Time
	UpdatedAt time.Time
}
