package service

import (
	"fmt"
	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/entity"
)

type ShiftService struct{}

type Shift entity.Shift

func (s ShiftService) FindByID(id int) ([]Shift, error) {
	db := db.GetDB()

	var shift []Shift

	if err := db.Take(&shift).Error; err != nil {
		return nil, err
	}

	if id == 0 {
		return nil, fmt.Errorf("query not found.")
	}

	if err := db.Table("shifts").Where("user_id = ?", id).Find(&shift).Error; err != nil {
		return nil, fmt.Errorf("%w", err)
	}

	fmt.Println(shift)

	return shift, nil
}
