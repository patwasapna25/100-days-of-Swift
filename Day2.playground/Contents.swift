import UIKit

// Sets
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

// Tuples
var name = (first: "Taylor", last: "Swift")
name.0
name.first

// Dictionary
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]

// Dictionary default values
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]
favoriteIceCream["Charlotte", default: "Unknown"]

// Creating empty collections
var teams = [String: String]()
var results = [Int]()
var words = Set<String>()
var numbers = Set<Int>()
var scores = Dictionary<String, Int>()
var result = Array<Int>()

// Enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

// Enum raw values
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let venus = Planet(rawValue: 2)
