package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"os"

	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/entity"
)

/*
   0: Index
   1: 局
   2: 部門
   3: 学年
   4: 氏名
   5: メール
   6: 電話
*/
type User struct {
	Name string
	Mail string
}

type Shift struct {
	UserId  int
	Time    string
	Work    string
	Weather string
}

func main() {
	if err := userInput(); err != nil {
		log.Fatal(err)
	}

	if err := shiftInput(); err != nil {
		log.Fatal(err)
	}

	fmt.Println("OK. Seed database.")
}

func shiftInput() error {
	f, err := os.Open("39th_pre_sunny.csv")
	if err != nil {
		return fmt.Errorf("cannot open csv: %w", err)
	}

	db.Init()
	tx := db.GetDB()

	r := csv.NewReader(f)

	record, err := r.ReadAll()
	if err != nil {
		return fmt.Errorf("read error: %w", err)
	}
	// 39thのシフトと変更点があるので修正必須
	// 学年と局の情報が追加されます。
	for i := 2; i < len(record[0]); i++ {
		for j := 2; j < len(record); j++ {
			var user entity.User
			if err := tx.Table("users").Where("name = ?", record[1][i]).First(&user).Error; err != nil {
				fmt.Println(err)
				i++
				break
			}
			fmt.Println(&user)
			shift := Shift{user.ID, record[j][0], record[j][i], "sunny"}
			fmt.Println(shift)
			result := tx.Create(&shift)
			if result.Error != nil {
				fmt.Println(shift)
				//				return fmt.Errorf("create db: %w", result.Error)
			}
		}
	}
	return nil
}

func userInput() error {
	f, err := os.Open("user.csv")
	if err != nil {
		return fmt.Errorf("cannot open csv: %w", err)
	}

	var user User

	db.Init()
	tx := db.GetDB()

	r := csv.NewReader(f)

	for {
		record, err := r.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			return fmt.Errorf("read error: %w", err)

		}

		user = User{Name: record[4], Mail: record[5]}
		result := tx.Create(&user)
		if result.Error != nil {
			fmt.Println(user)
			return fmt.Errorf("create db: %w", result.Error)
		}
	}

	return nil
}
