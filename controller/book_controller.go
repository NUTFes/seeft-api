package book

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	book "github.com/mashita1023/test-api/service"
)

type Controller struct{}

func (pc Controller) Index(c *gin.Context) {
	title := c.Query("title")
	category, _ := strconv.Atoi(c.Query("category"))
	author := c.Query("author")

	var s book.Service
	p, err := s.Search(title, category, author)

	if err != nil {
		c.AbortWithStatus(http.StatusNotFound)
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}

func (pc Controller) GetCategory(c *gin.Context) {
	title := c.Query("title")
	category, _ := strconv.Atoi(c.Param("category"))
	author := c.Query("author")

	var s book.Service
	p, err := s.Search(title, category, author)

	if err != nil {
		c.AbortWithStatus(http.StatusNotFound)
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}
