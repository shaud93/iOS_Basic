//: [Previous](@previous)

import Foundation

// Sets [inference]
var reptile:Set = ["Snakes", "Turtles", "Alligator"]
print(reptile)

// Sets
var amphibian:Set<String> = ["Frog", "Toad", "Salamander"]
print(amphibian)

// Add To Set
reptile.insert("Dinosaur")
print(reptile)

// remove from Set
amphibian.remove("Toad")
print(amphibian)

// Does it exist in Set
amphibian.contains("Toad")
amphibian.contains("Salamander")

// empty Set
var mammals = Set<String>()

// dictionary
var zooEmployeeId:[String:Int] = ["John":022, "Mike":015]

// find dictionary
zooEmployeeId["John"]

// dictionary change value
zooEmployeeId["john"] = 12

// Add to dictionary
zooEmployeeId["Chris"] = 030

print(zooEmployeeId)

// dictionary remove [EX1]
zooEmployeeId["Chris"] = nil

print(zooEmployeeId)

//dictionary remove [EX2]
zooEmployeeId.removeValue(forKey: "Mike")

print(zooEmployeeId)

// optional
var zooBreakOut:String?
var zooAnimalAttack:String?

// adding value to optional
zooBreakOut = "Notorious Jeffery The Giraffe"
zooAnimalAttack = "Luke The penguin"
// printing optional
print(zooBreakOut)

// unwrapping optional [if let]
if let escapee = zooBreakOut{
    print("EMERGENCY \(escapee) HAS ESCAPED!")
}

// unwraping optional [gaurd let]
func whoAttacked() {
    guard let attk = zooAnimalAttack else {
        return
    }
    print("\(attk) Has Attacked Several Of Our guest")
}

// Checking guardlet optional
print(zooAnimalAttack ?? "No Attacks")
zooAnimalAttack = nil
print(zooAnimalAttack ?? "No Attacks")

// unwrapping option [force] [will break code if nil]
zooBreakOut!

// class
class Bird {
    private var species:String
    private var color:String
    
    
    
    init(species: String, color: String) {
        self.species = species
        self.color = color
    }
    // Getters
    func getSpecies() ->String{
        return self.species
    }
    func getColor() ->String{
        return self.color
    }
    //Setters
    func SetSpecies(species:String){
        self.species = species
    }
    func setColor(color:String){
        self.color = color
    }
}
    
//calling class
let b1 = Bird(species: "bald eagle", color: "White and Brown")
let b2 = Bird(species: "Wild Turkey", color: "Brown and Black")

// getting class properties
b1.getSpecies()
b1.getColor()

//Changing class properties
b1.SetSpecies(species: "Common Raven")
b1.setColor(color: "black")
//Changing class properties [Results]
b1.getSpecies()
b1.getColor()

//extending Classes
class Pet:Bird {
    private var petName:String
    
    init(petName: String, species: String, color: String) {
        self.petName = petName
        super.init(species:species, color:color)
    }
    //getters
    func getPetName() ->String{
        return self.petName
    }
    //setters
    func setPetName(petname:String) {
        self.petName = petname
    }
}

//calling child class
let p1 = Pet(petName: "polly", species: "parrot", color: "Green")

//struct [no initializing needed]
struct Cat {
    var species:String
    var color:String
}

// calling struct
var s1 = Cat(species: "Tiger", color: "orange and black")
var s2 = Cat(species: "Canada lynx", color: "Brown and Gray")
