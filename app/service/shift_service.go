package service

import (
	"fmt"
	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/entity"
)

type ShiftService struct{}

type Shift entity.Shift

func (s ShiftService) Search(id int, date string, weather string) ([]Shift, error) {
	db := db.GetDB()

	var shift []Shift

	query := &Shift{UserID: id, Date: date, Weather: weather}
	fmt.Println(query)

	if err := db.Take(&shift).Error; err != nil {
		return nil, err
	}

	if err := db.Table("shifts").Where(query).Find(&shift).Error; err != nil {
		return nil, fmt.Errorf("%w", err)
	}

	return shift, nil
}
