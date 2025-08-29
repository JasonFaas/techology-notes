package main

import (
    "fmt"
    "time"
)

func main() {
    t := time.NewTicker(5 * time.Second)
    defer t.Stop()
    for {
        fmt.Println("hello world")
        <-t.C
    }
}
