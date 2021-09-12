package controller

import (
	"fmt"
	"net/http"

	"github.com/NUTFes/seeft/service"
	"github.com/gin-gonic/gin"
)

type AuthController struct{}

type jsonRequest struct {
	Mail     string `json:"mail"`
	Password string `json:"password"`
}

func (controller AuthController) Index(c *gin.Context) {
	var json jsonRequest
	if err := c.ShouldBindJSON(&json); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if json.Password != "gidaifes" {
		c.JSON(http.StatusBadRequest, gin.H{"error": "password is incorrect"})
		return
	}

	var service service.UserService
	p, err := service.FindByMail(json.Mail)

	if err != nil {
		c.AbortWithStatus(http.StatusNotFound)
		fmt.Println(err)
		return
	} else {
		c.JSON(http.StatusOK, p)
	}
}
