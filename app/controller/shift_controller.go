package controller

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/NUTFes/seeft/service"
	"github.com/gin-gonic/gin"
)

type ShiftController struct{}

func (controller ShiftController) Search(c *gin.Context) {
	id, _ := strconv.Atoi(c.Param("id"))
	day := c.Param("day")
	weather := c.Param("weather")

	var service service.ShiftService

	p, err := service.Search(id, day, weather)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": fmt.Sprintf("%s", err),
		})
		fmt.Println(err)
	} else {
		c.JSON(http.StatusOK, p)
	}
}
