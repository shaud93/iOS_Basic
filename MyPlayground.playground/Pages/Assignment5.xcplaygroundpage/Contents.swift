//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

class favoriteNumClass<T> {
    var fav: T
    
    init(fav: T) {
        self.fav = fav
    }
    
    func res(){
        print("Your favorite number is: \(fav)")
    }
}

//string
var ex1 = favoriteNumClass(fav: "fifty five")
ex1.res()

//integer
var ex2 = favoriteNumClass(fav: 55)
ex2.res()


//Generic Struct
struct favoriteNumStruct<T>{
    var fav: T
    
    func res(){
        print("Your favorite number is: \(fav)")
    }
}

var ex3 = favoriteNumStruct(fav: "eighty eight")
ex3.res()

var ex4 = favoriteNumStruct(fav: 88)
ex4.res()

//closures

//non escaping closure And [Trailing Closure]
func nonEscapingClosure(name:String, completion: () -> Void){
    print("Hello \(name) the closure  has started")
    completion()
    print("closure ended")
}

nonEscapingClosure(name: "Shrek") {
    print("Hi i am Closure")
}


// escaping closure And [Auto closure]
func EscapingClosure(completion: @escaping () -> Void){
    print("closure started")
    DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
        completion()
    }
    print("closure end")
}

EscapingClosure {
    print("Hello")
}

//Higher Order Functions
var arr1 = [11, 22, 99, 88, 55, 36, 1, 18]

//for each
arr1.forEach { x in
    print(x)
    print(x * 2)
}

//map
var ex5 = arr1.map { x in
    x * 2
}

print(ex5)

//filter
var ex6 = arr1.filter{$0 > 50}

print(ex6)

//reduce
var ex7 = arr1.reduce(0, +)

print(ex7)

//sorted
var ex8 = arr1.sorted()

print(ex8)

