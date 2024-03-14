import UIKit

// Closures

let driving = {
    print("Driving a car")
}
driving()

// Accepting parameter in closures
let driving1 = { (place: String) in
    print("Driving to \(place)")
}

driving1("London")

// Returing value from closure
let driving2 = { (place: String) -> String in
    return "Driving to new place \(place)"
}

let message = driving2("Mumbai")
print(message)

// Closures as parameter
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

// Trailing closure syntax
travel {
    print("Testing trailing closure syntax")
    driving()
}
