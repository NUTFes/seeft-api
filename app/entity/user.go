package entity

type User struct {
	ID   int
	Name string `gorm:"size:128"`
}
