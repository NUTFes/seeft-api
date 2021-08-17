package main

import (
	"github.com/mashita1023/test-api/db"
	"github.com/mashita1023/test-api/server"
)

func main() {
	db.Init()
	server.Init()
}
