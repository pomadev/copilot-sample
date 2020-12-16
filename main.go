package main

import "fmt"

func main() {
	fmt.Printf("1 + 2 = %v\n", add(1, 2))
}

func add(a, b int) int {
	return a + b
}
