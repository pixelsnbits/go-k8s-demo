package main

import (
	"net/http"
	"github.com/labstack/echo"
)

func main() {
	e := echo.New()
	e.HideBanner = true
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!\nVersion 0.7")
	})
	e.Logger.Fatal(e.Start(":1337"))
}
