import UIKit

// Parameter labels in functions
func sayHello(to name: String) {
    print("Hello, \(name)!")
}
sayHello(to: "Taylor")

// Omitting parameter labels
func greet(_ person: String) {
    print("Hello, \(person)")
}
greet("Sapna")

// Default parameters
func greet1(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person) again...")
    }
}
greet1("Taylor")
greet1("Taylor", nicely: false)

// Variadic functions
func sqaure(numbers: Int...) {
    for number in numbers {
        print("\(number) sqaured is \(number*number)")
    }
}
sqaure(numbers: 1,2,3,4,5)

// throws
enum PassError: Error {
    case obvious
}

func checkPassword(password: String) throws -> Bool {
    if password == "password" {
        throw PassError.obvious
    }
    return true
}
do {
    try checkPassword(password: "password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

// inout parameter (call be reference)
func doubleInPlace(number: inout Int) {
    number *= 2
}
var myNum = 10 
doubleInPlace(number: &myNum)
print(myNum)
