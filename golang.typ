# Go Programming Practice
*:GO_LANG
B:Go Programming Concepts
T:In this lesson, we'll practice typing Go code with explanations of various programming concepts.

I:(1) Hello World
S:# Print 'Hello, World!' to the console
 :package main
 :import "fmt"
 :
 :func main() {
 :    fmt.Println("Hello, World!")
 :}

I:(2) Variables and Types
S:# Declare variables and print their values
 :package main
 :import "fmt"
 :
 :func main() {
 :    var message string = "Hello, Go!"
 :    age := 25
 :    fmt.Println(message)
 :    fmt.Println("Age:", age)
 :}

I:(3) Control Flow - If Statements
S:# Implement a simple if statement
 :package main
 :import "fmt"
 :
 :func main() {
 :    temperature := 25
 :    if temperature > 30 {
 :        fmt.Println("It's hot outside!")
 :    } else {
 :        fmt.Println("It's a pleasant day.")
 :    }
 :}

I:(4) Control Flow - Loops
S:# Use a for loop to print numbers 1 to 5
 :package main
 :import "fmt"
 :
 :func main() {
 :    for i := 1; i <= 5; i++ {
 :        fmt.Println(i)
 :    }
 :}

I:(5) Functions
S:# Define and call a simple function
 :package main
 :import "fmt"
 :
 :func greet(name string) {
 :    fmt.Println("Hello,", name)
 :}
 :
 :func main() {
 :    greet("Alice")
 :    greet("Bob")
 :}

I:(6) Arrays and Slices
S:# Declare and manipulate arrays and slices
 :package main
 :import "fmt"
 :
 :func main() {
 :    // Array
 :    var numbers [3]int
 :    numbers[0] = 1
 :    numbers[1] = 2
 :    numbers[2] = 3
 :
 :    // Slice
 :    names := []string{"Alice", "Bob", "Charlie"}
 :
 :    fmt.Println(numbers)
 :    fmt.Println(names)
 :}

I:(7) Maps
S:# Use a map to store key-value pairs
 :package main
 :import "fmt"
 :
 :func main() {
 :    // Map
 :    scores := map[string]int{"Alice": 95, "Bob": 87, "Charlie": 92}
 :
 :    fmt.Println(scores)
 :}

I:(8) Structs
S:# Define and use a struct
 :package main
 :import "fmt"
 :
 :type Person struct {
 :    Name    string
 :    Age     int
 :    Country string
 :}
 :
 :func main() {
 :    // Struct
 :    person := Person{Name: "Alice", Age: 30, Country: "USA"}
 :
 :    fmt.Println(person)
 :}

I:(9) Interfaces
S:# Implement and use interfaces
 :package main
 :import "fmt"
 :
 :type Shape interface {
 :    Area() float64
 :}
 :
 :type Circle struct {
 :    Radius float64
 :}
 :
 :func (c Circle) Area() float64 {
 :    return 3.14 * c.Radius * c.Radius
 :}
 :
 :func printArea(s Shape) {
 :    fmt.Println("Area:", s.Area())
 :}
 :
 :func main() {
 :    // Interface
 :    circle := Circle{Radius: 5}
 :    printArea(circle)
 :}

I:(10) Concurrency - Goroutines
S:# Create and run a simple Goroutine
 :package main
 :import (
 :    "fmt"
 :    "time"
 :)
 :
 :func printNumbers() {
 :    for i := 1; i <= 5; i++ {
 :        time.Sleep(1 * time.Second)
 :        fmt.Println(i)
 :    }
 :}
 :
 :func main() {
 :    // Goroutine
 :    go printNumbers()
 :    time.Sleep(6 * time.Second) // Wait for Goroutine to finish
 :}

Q:Do you want to continue to the next

