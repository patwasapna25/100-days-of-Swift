import UIKit

// for loop
let count = 1...10

for number in count {
    print("Number is \(number)")
}

// while loop
var number = 1

while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come!")

// Repeat loop
number = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, here I come!")

// Exiting multiple loops

outerloop: for i in 1...10 {
    for j in 1...10 {
        let product = i*j
        print ("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("Breaking out of loop")
            break outerloop
        }
    }
}
