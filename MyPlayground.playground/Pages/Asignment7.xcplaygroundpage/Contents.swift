//: [Previous](@previous)

import Foundation

class Customer{
    // varibles below are consider as strong ref
    var name:String
    var email:String
    var item:String
    var membershipId:Int
    var store:SamsClub?
    
    init(name: String, email: String, item: String, membershipId: Int) {
        self.name = name
        self.email = email
        self.item = item
        self.membershipId = membershipId
    }
    
    deinit{
        self.store = nil
        print("Customer deinitialization completed")
    }
}

class SamsClub{
    var customer:Customer? //WEAK GOES HERE
    var IsMember:Bool
    
    init(IsMember: Bool) {
        self.IsMember = IsMember
    }
    
    deinit{
        self.customer = nil
        print("Sams deinitialazion completed")
    }
}

// [CX] ref count now = 1
var cx:Customer? = Customer(name: "john joseph", email: "johnjoseph@gmail.com", item: "apple", membershipId: 123456)

// [CX] class properties are accessable and it populated
print(cx?.name ?? "empty")

// [CX] ref count now = 0 [ark/garbage collector has now ran]
cx = nil

//[CX] class property is now empty because ark/garbage collector has removed it
print(cx?.name ?? "empty")

// [CX] ref count now = 1
cx = Customer(name: "john joseph", email: "johnjoseph@gmail.com", item: "apple", membershipId: 123456)

//[SC] ref count now = 1
var sc:SamsClub? = SamsClub(IsMember: true)


//RETAIN CYCLE HOW TO SOLVE
cx?.store = sc
sc?.customer = cx

// the deinit should be called but i wasnt called
sc = nil
cx = nil

//[ADD WEAK TO SAMSCLUB CUSTOMER VAR]
//[RUN LINE 65 AGAIN]

//[NOW THE DEINIT RUNS BECAUSE WE ADDED THE WEAK KEYWWORD]

//main que [FIFO] [detecated to the UI]
DispatchQueue.main.async {
    for x in 0...1000 {
        print(x)
    }
    print("First Thread has completed")
}

DispatchQueue.main.async {
    print("Second Thread has completed")
}

//serial que
let serialQue1 = DispatchQueue(label: "Q1")
let serialQue2 = DispatchQueue(label: "Q2")

serialQue1.async {
    print("serial que 1") //runs first
}

serialQue1.async {
    print("serial que 2") //runs second
}

//concurrent que [order is determined by task]
let concurentQue1 = DispatchQueue(label: "CQ1", attributes:.concurrent)
let concurentQue2 = DispatchQueue(label: "CQ2", attributes:.concurrent)
let concurentQue3 = DispatchQueue(label: "CQ3", attributes:.concurrent)

concurentQue1.async {
    for x in 0...1000 {
        print(x)
    }
    print("Concurrent que 1")  // will finish last
}

concurentQue2.async {
    print("Concurrent que 2")
}

concurentQue3.async {
    print("Concurrent que 3")
}
