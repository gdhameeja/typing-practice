# Java Basics Practice
*:JAVA_BASICS
B:Java Basics
T:In this lesson, we'll practice typing basic Java code snippets.
 :
I:(1) Warm up
D:The quick brown fox jumps over the lazy dog.
 :Java is a versatile programming language widely used for web development, mobile apps, and more.

I:(2) Type the basic Java data types
D:int age = 25;
 :double price = 19.99;
 :char grade = 'A';
 :String name = "John";

I:(3) Declare and initialize arrays
D:int[] numbers = {1, 2, 3, 4, 5};
 :String[] fruits = {"Apple", "Banana", "Orange"};

I:(4) Practice with loops
D:for (int i = 1; i <= 5; i++) {
 :    System.out.println("Count: " + i);
 :}

I:(5) Type conditional statements
D:int x = 10;
 :if (x > 0) {
 :    System.out.println("Positive");
 :} else {
 :    System.out.println("Non-positive");
 :}

I:(6) Try a simple method
S:// Method to add two numbers
 :public int add(int a, int b) {
 :    return a + b;
 :}
 :
 :// Call the method
 :int result = add(5, 7);
 :System.out.println("Result: " + result);

I:(7) Practice with classes
D:// Simple class
 :class Car {
 :    String make;
 :    String model;
 :}
 :
 :// Create an instance
 :Car myCar = new Car();
 :myCar.make = "Toyota";
 :myCar.model = "Camry";

I:(8) Try a basic exception handling
S:try {
 :    int[] numbers = {1, 2, 3};
 :    System.out.println(numbers[5]); // This will throw an ArrayIndexOutOfBoundsException
 :} catch (Exception e) {
 :    System.out.println("An error occurred: " + e.getMessage());
 :}

I:(9) And a sample program
S:// Simple Java program
 :public class HelloWorld {
 :    public static void main(String[] args) {
 :        System.out.println("Hello, World!");
 :    }
 :}
Q:Do you want to continue to the next lesson [Y/N] ?
N:MENU

