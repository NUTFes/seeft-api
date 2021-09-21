package controller

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/NUTFes/seeft/service"
	"github.com/gin-gonic/gin"
)

type ShiftController struct{}

func (controller ShiftController) FindByID(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))

	var service service.ShiftService
	p, err := service.FindByID(id)

	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": fmt.Sprintf("%s", err),
		})
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}

func (controller ShiftController) FindByIDAndDate(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))
	date := c.Param("date")

	var service service.ShiftService
	p, err := service.FindByIDAndDate(id, date)
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{
			"error": fmt.Sprintf("%s", err),
		})
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}
