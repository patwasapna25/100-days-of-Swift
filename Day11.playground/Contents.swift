import UIKit

// Portocols
protocol Identifiable {
    var id: String { get set}
}
struct User: Identifiable {
    var id: String
}
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

// Protocol inheritance
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation {}

// extension
extension Int {
    func sqaured() -> Int {
        return self * self
    }
}
let number = 8
number.sqaured()

// Protocols extensions
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("Ther are \(count) of us:")
        for name in self {
            print(name)
        }
    }
}
pythons.summarize()
beatles.summarize()

// Protocol-oriented programming
protocol Identifiable1 {
    var id: String { get set }
    func identify()
}

extension Identifiable1 {
    func identify() {
        print("My ID is \(id).")
    }
}
