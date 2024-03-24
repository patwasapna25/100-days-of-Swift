import UIKit

// Revision

// Properties
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    
    var age: Int
    
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts", age: 25)
taylor.clothes = "short skirts"
print(taylor.ageInDogYears)

// Static properties
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"

    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


// Polyporphism
class Album {
    var name: String

    init(name: String) {
        self.name = name
    }

    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String

    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String

    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }

    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}

// Protocols
protocol Employee {
    var name: String { get set }
    var jobTitle: String { get set }
    func doWork()
}
struct Executive: Employee {
    var name = "Steve Jobs"
    var jobTitle = "CEO"

    func doWork() {
        print("I'm strategizing!")
    }
}

struct Manager: Employee {
    var name = "Maurice Moss"
    var jobTitle = "Head of IT"

    func doWork() {
        print("I'm turning it off and on again.")
    }
}
let staff: [any Employee] = [Executive(), Manager()]

for person in staff {
    person.doWork()
}
