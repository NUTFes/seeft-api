package service

import (
	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/entity"
)

type WorkService struct{}

type work struct {
	ID        int
	Name      string
	URL       string
	Users     string
	Place     string
	President string
	TEL       string
}

func (s WorkService) WorkWithUser(userID int, day string, weather string, workID int, time string) (*work, error) {
	db := db.GetDB()

	var workWithoutUser work
	var work work

	err := db.Raw(`
select works.id, works.name, works.url, group_concat(users.name) as users, works.place, works.president, works.tel
from shifts 
left join users on users.id = shifts.user_id 
left join works on works.id = shifts.work_id 
where date = ? and weather = ? and work_id = ? and time = ? and user_id <> ? 
group by works.id
`, day, weather, workID, time, userID).Find(&work).Error

	if err != nil {
		if err := db.Table("works").
			Select("works.id, works.name, works.url,  works.place, works.president, works.tel").
			Joins("left join shifts on works.id = shifts.work_id").
			Where("shifts.date = ?", day).
			Where("shifts.weather = ?", weather).
			Where("shifts.work_id = ?", workID).
			Where("shifts.time = ?", time).
			Find(&workWithoutUser).Error; err != nil {
			return nil, err
		}
		return &workWithoutUser, nil
	}
	return &work, nil
}

func (s WorkService) WorkList() ([]entity.Work, error) {
	db := db.GetDB()

	var works []entity.Work

	if err := db.Table("works").Find(&works).Error; err != nil {
		return nil, err
	}

	return works, nil
}
