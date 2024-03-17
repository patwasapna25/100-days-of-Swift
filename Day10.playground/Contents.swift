import UIKit

//Class

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof!")
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")

// Inheritance
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodel")
    }
}


// overriding
class Poodle1: Dog {
    override func makeNoise() {
        print("Yip!")
    }
}
let poppy1 = Poodle1(name: "Poo", breed: "Poodle")
poppy1.makeNoise()

// copying object
class Singer {
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Biber"
print(singer.name)


// Deinitializer
class Person {
    var name = "Sapna"
    deinit {
        print("\(name) is no more!")
    }
    init() {
        print("\(name) is alive")
    }
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}
