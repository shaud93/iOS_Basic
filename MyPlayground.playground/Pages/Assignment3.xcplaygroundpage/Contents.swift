//: [Previous](@previous)

import Foundation

var food = ["Taco","Burger", "Steak", "Fries", "Pasta", "Pizza"]

var foodPrices = ["Taco":2.99, "Burger":8.99, "Steak":12.99, "Pasta":8.99, "Pizza":9.99]

var num = [0,1,2,3,4,5,6,7,8,9]

// Loop [Ex1] [Array]
for x in food {
    print(x)
}

// Loop [Ex2] [Result 0,1,2,3,4,5,6,7,8,9,10]
for i in 0...10{
    print(i)
}

// Loop [Ex3] [Result 5,6,7,8,9,10]
for i in 5...10{
    print(i)
}

// Loop [Ex4] [Result 0,1,2,4,5,6,7,8,9]
for i in 0..<10{
    print(i)
}

// Loop [Dictionary]
for(item, price) in foodPrices {
    print("Item:\(item) Price:\(price)")
}

// Nested Loop [Result 00-99]
for x in num {
    for z in num {
        print("\(x)\(z)")
    }
}

// While Loop [print even numbers from 1-10]
var start = 1

while start != 11 {
    if start % 2 == 0 {
        print(start)
    }
    start += 1
}

// Do While Loop [print even numbers from 1-10]
start = 1

repeat{
    if start % 2 == 0 {
        print(start)
    }
    start += 1
}while start <= 10


// if statements [?? unwraps optional if its empty 0.00 will be asigned to it]
var cash = 10.00

if (cash > foodPrices["Pasta"] ?? 0.00) {
    print("You have enough")
}

// if and else statments [result: you do not have enough]
if (cash > foodPrices["Steak"] ?? 0.00) {
    print("You have enough")
} else {
    print("You Do not have Enough")
}

// else if statments [result: You Purchased a Taco]
var ticket = "Taco"

if (ticket == "Pizza"){
    print("You Purchased a Pizza")
}
else if ( ticket == "Taco"){
    print("You Purchased a Taco")
}
else{
    print("Sorry this recipt is not valid")
}

//switch [result: You Purchased a Burger]
ticket = "Burger"

switch ticket {
case "Taco":
    print("You Purchased a Taco")
case "Pizza":
    print("You Purchased a Pizza")
case "Pasta":
    print("You Purchased a Pasta")
case "Steak":
    print("You Purchased a Steak")
case "Burger":
    print("You Purchased a Burger")
default:
    print("Sorry this recipt is not valid")
}

// #1 default init/constructor [class]
class Pizza {
    var size: String = "med"
    var dough:String = "Thin"
    var topping:String = "Pepperoni"
}
let p1 = Pizza() //no prams needed because class varibles is already populated
print("You ordered a \(p1.size) \(p1.dough) \(p1.topping) pizza")

// # 2 Member Wise init/constructor [struct] [no init/constructor needed]
struct PizzaStruct {
    var size:String
    var dough:String
    var topping:String
}
let p2 = PizzaStruct(size: "Large", dough: "Pan", topping: "Sausage")
print("You ordered a \(p2.size) \(p2.dough) \(p2.topping) pizza")

// #3 Custom init/constructor [class]
class PizzaCustom {
    var size: String
    var dough:String
    var topping:String
    
    init(size: String, dough: String, topping: String) {
        self.size = size
        self.dough = dough
        self.topping = topping
    }
}
let p3 = PizzaCustom(size: "Small", dough: "Hand Tossed", topping: "Bacon")
print("You ordered a \(p3.size) \(p3.dough) \(p3.topping) pizza")

// # 4 failable init/Constructor [result: nil]
struct PizzaFail {
    var size:String
    var dough:String
    var topping:String
    var quanity:Int
    
    init?(size: String, dough: String, topping: String, quanity: Int) {
        self.size = size
        self.dough = dough
        self.topping = topping
        //if quanity is over 7 class is nil
        if (quanity <= 7){
            self.quanity = quanity
        }
        else {
            return nil
        }
    }
}
let p4 = PizzaFail(size: "XL", dough: "Pan", topping: "Chicken", quanity: 8)
print(p4)

// #5 Required init/constructor result[100, 70]
class classA {
    required init(){
        var a = 70
        print(a)
    }
}

class classB: classA{
    required init(){
        var b = 100
        print(b)
    }
}
let obj1 = classB()

// enum
enum planets {
    case mercury
    case venus
    case earth
    case mars
    case jupitor
    case saturn
    case uranus
    case neptune
}
// enum geting value
let home = planets.earth
print(home)

// enum use [EX1] [result: neptune is 2.7019 billion miles from Earth]
var travelDistance = planets.neptune

switch travelDistance {
case .mercury:
    print("Mercury is 132.93 million miles from Earth")
case .venus:
    print("venus is 63.764 million miles from Earth")
case .mars:
    print("Mars is 237.84 million miles from Earth")
case .jupitor:
    print("jupitor is 371.48 million miles from Earth")
case .saturn:
    print("saturan is 854.3 million miles from Earth")
case .uranus:
    print("uranus is 1.7379 billion miles from Earth")
case .neptune:
    print("neptune is 2.7019 billion miles from Earth")
default:
    print("Welcome Home")
}

// loop through enum [CaseIterable]
enum planets2: CaseIterable {
    case mercury
    case venus
    case earth
    case mars
    case jupitor
    case saturn
    case uranus
    case neptune
}
for planet in planets2.allCases{
    print(planet)
}

// enum raw value [result: uranus is 1.7379 billion miles from Earth]
enum planets3:String {
    case mercury = "Mercury is 132.93 million miles from Earth"
    case venus = "venus is 63.764 million miles from Earth"
    case earth = "Welcome Home"
    case mars = "Mars is 237.84 million miles from Earth"
    case jupitor = "jupitor is 371.48 million miles from Earth"
    case saturn = "saturan is 854.3 million miles from Earth"
    case uranus = "uranus is 1.7379 billion miles from Earth"
    case neptune = "neptune is 2.7019 billion miles from Earth"
}
print(planets3.uranus.rawValue)

//mutating func [struct] [stucts are not ref type like classes]
struct explorer{
    var visitedPlanet = Set<String>()
    
    mutating func push(planet:String){
        visitedPlanet.insert(planet)
    }
}

var explored = explorer()
print(explored.visitedPlanet)
explored.push(planet: "mars")
print(explored.visitedPlanet)
explored.push(planet: "venus")
print(explored.visitedPlanet)
//: [Next](@next)
