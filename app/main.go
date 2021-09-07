package main

import (
	"github.com/NUTFes/seeft/db"
	"github.com/NUTFes/seeft/server"
)

func main() {
	db.Init()
	server.Init()
}
