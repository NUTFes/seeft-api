package controller

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/NUTFes/seeft/service"
	"github.com/gin-gonic/gin"
)

type UserController struct{}

func (controller UserController) Index(c *gin.Context) {

	var service service.UserService
	p, err := service.GetAll()

	if err != nil {
		c.AbortWithStatus(http.StatusNotFound)
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}

func (pc UserController) FindByID(c *gin.Context) {
	id, _ := strconv.Atoi(c.Query("id"))

	var s service.UserService
	p, err := s.FindByID(id)

	if err != nil {
		c.AbortWithStatus(http.StatusNotFound)
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}
