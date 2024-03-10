import UIKit

// Ternary operator

let firstCard = 11
let secondCard = 10

print(firstCard == secondCard ? "Cards are same": "Cards are different")

// Switch
let weather = "sunny"
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}

// Range Operators
let score = 85

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}
