//: [Previous](@previous)

import Foundation

// protocol/interface
protocol fighterEx1 {
    var name:String {get set}
    var specialAttack:String {get set}
    var wins: Int {get set}
    var loses: Int {get set}
}

// implementing protocal [protocal members must be initiated when implemented]
class chosenFighter:fighterEx1 {
    var name:String = "Cookie Monster"
    var specialAttack:String = "Double Dip"
    var wins: Int = 7
    var loses: Int = 2
}
var f1 = chosenFighter()


// protocal [optional]
protocol fighterEx2 {
    var name:String {get set}
    var specialAttack:String {get set}
    var wins: Int {get set}
    var loses: Int {get set}
    func taunt() -> String
}

extension fighterEx2{ // the class/struct/enum will have a choice to implement this
    func taunt() -> String {
        return ("\(name) has taunted")
    }
}
// class was able to be made without implementing the taunt function
class chosenFighter2: fighterEx2 {
    var name:String = "Shrek"
    var specialAttack:String = "Swamp-Plex"
    var wins: Int = 10
    var loses: Int = 0
}

var f2 = chosenFighter2()
f2.taunt() // protocal varibles are acessible through extension


// extension EX! [extending a dataType]
extension Int{
    func isEven() -> Bool {
        return self % 2 == 0
    }
}
print(9.isEven())


//properties
class chosenFighter3{
    // stored property
    var name:String = "Mr Krabs"
    var specialAttack:String = "krabby beat down"
    var movement:Int = 2
    var wins: Int = 12
    var loses: Int = 3
    
    // computed property
    func maxMovement() -> Int{
        return self.movement * 2
    }
    
    // lazy property
    lazy var info:String = {
        return "fighter: \(self.name)\n Wins: \(self.wins)\n Loses: \(loses)"
    }()
}
var f3 = chosenFighter3()
print(f3.maxMovement())
print(f3.info)

// generics
func doubleMe<T: Numeric>(value: T){
    print(value + value)
}
doubleMe(value: 10)
doubleMe(value: 10.00)

//: [Next](@next)
