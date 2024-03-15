import UIKit

// Structs
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)

// Computed
struct Sport1 {
    // stored propertied
    var name: String
    var isOlympicStatus: Bool
    
    //computed properties
    var olympicStaus: String {
        if isOlympicStatus {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport1(name: "ChessBoxing", isOlympicStatus: false)
print(chessBoxing.olympicStaus)

// Property observers
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

// Methods
struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population*1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
person.makeAnonymous()

// Properties and methods of string
let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// Properties and methods of arrays
var toys = ["Woody"]
toys.count
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
toys.remove(at: 0)

