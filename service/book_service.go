package book

import (
	"github.com/mashita1023/test-api/db"
	"github.com/mashita1023/test-api/entity"
)

type Service struct{}

type Book entity.Book

type Parameter struct {
	title    string
	category int
	author   string
}

func (s Service) Search(title string, category int, author string) ([]Book, error) {

	db := db.GetDB()

	var book []Book

	p := Parameter{title, category, author}

	if err := db.Take(&book).Error; err != nil {
		return nil, err
	}

	tx := db
	tx = tx.Find(&book)

	if p.title != "" {
		tx = tx.Where("title = ?", p.title).Find(&book)
	}

	if p.category != 0 {
		tx = tx.Where("category = ?", p.category).Find(&book)
	}

	if p.author != "" {
		tx = tx.Where("author = ?", p.author).Find(&book)
	}

	return book, nil
}
