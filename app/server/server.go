package server

import (
	"github.com/NUTFes/seeft/controller"
	"github.com/gin-gonic/gin"
	"net/http"
)

func Init() {
	r := router()
	r.Run(":3000")
}

func router() *gin.Engine {
	r := gin.Default()

	r.Use(CORS())

	health := r.Group("/healthz")
	{
		healthController := controller.HealthController{}
		health.GET("/", healthController.GetHealth)
	}

	user := r.Group("/user")
	{
		userController := controller.UserController{}
		user.GET("/:id", userController.FindByID)
		user.GET("/", userController.Index)
	}

	auth := r.Group("/auth")
	{
		authController := controller.AuthController{}
		auth.POST("/", authController.Index)
		auth.POST("/attendance", authController.PostCheck)
		auth.GET("/:mail", authController.MailAuth)
	}

	shift := r.Group("/shift")
	{
		shiftController := controller.ShiftController{}
		shift.GET("/:id", shiftController.Search)
		shift.GET("/:id/:date", shiftController.Search)
		shift.GET("/:id/:date/:weather", shiftController.Search)
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
