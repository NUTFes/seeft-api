package service

import (
	"fmt"

	"github.com/NUTFes/seeft/db"
	//	"github.com/NUTFes/seeft/entity"
)

type ShiftService struct{}

type Shift struct {
	ID      int
	UserID  int
	Date    string
	Time    string
	Work    string
	WorkID  int
	URL     string
	Color   string
	Weather string
}

type Work struct {
	ID   int
	Name string
	URL  string
}

func (s ShiftService) Search(id int, date string, weather string) ([]Shift, error) {
	db := db.GetDB()

	var shift []Shift

	query := &Shift{UserID: id, Date: date, Weather: weather}
	fmt.Println(query)

	if err := db.Take(&shift).Error; err != nil {
		return nil, err
	}

	if err := db.Table("shifts").Select("shifts.*, works.name as work, works.url, works.color").Where(query).Joins("left join works on shifts.work_id = works.id").Find(&shift).Error; err != nil {
		return nil, fmt.Errorf("%w", err)
	}

	if len(shift) == 0 {
		return nil, fmt.Errorf("Shift is not find.")
	}

	return shift, nil
}

func (s ShiftService) PostCheck(id int) error {
	db := db.GetDB()

	fmt.Printf("shifts.id: %v\n", id)

	if err := db.Table("shifts").Where("id = ?", id).Update("attendance", 1).Error; err != nil {
		return fmt.Errorf("%w", err)
	}

	return nil
}
