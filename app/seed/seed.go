package main

import (
	"encoding/csv"
	"fmt"
	"io"
	"log"
	"os"

	"github.com/NUTFes/seeft/db"
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

func main() {

	f, err := os.Open("user.csv")
	if err != nil {
		log.Fatal(err)
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
			log.Fatal(err)
		}

		user = User{Name: record[4], Mail: record[5]}
		result := tx.Create(&user)
		if result.Error != nil {
			fmt.Println(user)
			log.Fatalf("%s\n", result.Error)
		}
	}

}
