//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"


//global queue syntax
DispatchQueue.global().async(){
    print("Global Que")
}

//user interactive [animations]
DispatchQueue.global(qos: .userInteractive).async {
    print("user interactive")
}

//user initiated [user need immediate results EX: refresh screen]
DispatchQueue.global(qos: .userInitiated).async {
    print("user initiated")
}

//utility [long running task and user know its EX1: downloading songs, movies]
DispatchQueue.global(qos: .utility).async {
    print("utility")
}

//bacground [tasks that user not aware of EX: cloud save]
DispatchQueue.global(qos: .background).async {
    print("background")
}

//default [least important user needed immediate results]
DispatchQueue.global(qos: .default).async {
    print("default")
}

//unspecified
DispatchQueue.global(qos: .unspecified).async {
    print("unspecified")
}


//Operation Queue [like gcd with more control like pause , resume, and stop]
let taskLettuce = BlockOperation{
    print("adding lettuce")
}

let taskBeef = BlockOperation{
    print("adding beef")
}

let taskOnion = BlockOperation{
    print("adding Onion")
}
 let operationQueue = OperationQueue()

//make lettuce get called after beef
taskLettuce.addDependency(taskBeef)

operationQueue.addOperations([taskLettuce,taskBeef,taskOnion], waitUntilFinished: false)

//make it so only 1 operation is ran at a time
operationQueue.maxConcurrentOperationCount = 1

operationQueue.isSuspended

operationQueue.cancelAllOperations()

func task1() async{
    print("task1")
}
func task2() async{
    print("task2")
}

Task{
    await task1()
    await task2()
}

//actor [Actor are like classes but it don’t support inheritance] [use less memory] [thread safe] [avoid race condition] [released 2019]
actor bankDetails {
    var balance:Double
    
    init(balance: Double) {
        self.balance = balance
    }
}
