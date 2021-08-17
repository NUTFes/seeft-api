package server

import (
	"github.com/gin-gonic/gin"
	book "github.com/mashita1023/test-api/controller"
	"net/http"
)

func Init() {
	r := router()
	r.Run(":3000")
}

func router() *gin.Engine {
	r := gin.Default()

	r.Use(CORS())

	u := r.Group("/books")
	{
		ctrl := book.Controller{}
		u.GET("", ctrl.Index)
	}

	t := r.Group("/book")
	{
		ctrl := book.Controller{}
		t.GET("/:category", ctrl.GetCategory)
	}

	return r
}

func CORS() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.Writer.Header().Set("Access-Control-Allow-Origin", "*")
		c.Writer.Header().Set("Access-Control-Allow-Credentials", "true")
		c.Writer.Header().Set("Access-Control-Allow-Headers", "Content-Type, Content-Length, Accept-Encoding, X-CSRF-Token, Authorization, accept, origin, Cache-Control, X-Requested-With")
		c.Writer.Header().Set("Access-Control-Allow-Methods", "GET, OPTIONS")

		if c.Request.Method == "OPTIONS" {
			c.AbortWithStatus(http.StatusNoContent)
			return
		}

		c.Next()
	}
}
