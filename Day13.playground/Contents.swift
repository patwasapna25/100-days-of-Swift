import UIKit

// Revision

// Operator
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

var c = a + b
c > 3
c >= 3
c > 4
c < 4

// String Interpolation
var age = 25
"You are \(age) years old. In another \(age) years you will be \(age * 2)."

//Arrays
var evenNumbers = [2, 4, 6, 8]
var songs = ["Shake it Off", "You Belong with Me", "Back to December"]
songs[0]
songs[1]
songs[2]
type(of: songs)
var songs1: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

// Dictionary
var person = [
                "first": "Taylor",
                "middle": "Alison",
                "last": "Swift",
                "month": "December",
                "website": "taylorswift.com"
            ]

person["middle"]
person["month"]

// loops
for song in songs {
    if song == "You Belong with Me" {
        continue
    }

    print("My favorite song is \(song)")
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}
