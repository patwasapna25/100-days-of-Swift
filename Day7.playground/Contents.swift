import UIKit

//Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}
    
// Using closures as parameters when they return values
func travel1(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel1 { (place: String) -> String in
    return "Going to \(place) in my car"
}


// Shorthand parameter names

travel1 { place in
    "Going to new place using different function \(place)"
}

travel1 {
    "Going to new place using different function \($0)"
}

// Closures with multiple parameters
func travel2(action: (String, Int) -> String) {
    print("Writng new function travel2")
    let desp = action("Mumbai", 100)
    print(desp)
    print("Closing travel2 function")
}

travel2 {
    "Called by function traval2 with first param \($0) second param \($1)"
}

// Returning closures from function
func travel3() -> (String) -> Void {
    return {
        print("Returning a closure from this function with param \($0)")
    }
}

let result = travel3()
result("Delhi")

let result2 = travel3()("New delhi")

// Capturing values
func travel4() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter) Running closure function along with counter var \($0)")
        counter += 1
    }
}

let result1 = travel4()
result1("Delhi")
result1("London")
result1("London")
result1("London")
