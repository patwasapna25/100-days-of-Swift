import UIKit

// Handling missing data
var age: Int? = nil
age = 38

// unwarpping optionals
var name: String? = nil
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// unwrapping with guard
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}

// force unwrapping
let str = "5"
let num = Int(str)!

// Nil coalescing
func username(for id: Int) -> String? {
    if id == 1 {
       return "Taylor Swift" 
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

//optional chaining
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()

//Optional try
enum PasswordError: Error {
    case obvious
}
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}
if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

// Failable initializers
struct Person {
    var id: String

    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

// typecasting
class Animal {}
class Fish: Animal {}

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
