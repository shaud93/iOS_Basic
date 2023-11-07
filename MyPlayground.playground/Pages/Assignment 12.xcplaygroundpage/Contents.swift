//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//DispatchGroup
let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
DispatchQueue.global().async {
    print("Task 1")
    dispatchGroup.leave()
}

dispatchGroup.enter()
DispatchQueue.global().async {
    print("Task 2")
    dispatchGroup.leave()
}

dispatchGroup.notify(queue: .main) {
    print("Task 1 and 2 is done")
}

struct UserData {
    let name: String
    let friends: [String]
    let highScores: [Int]
}

func getUser() async -> String {
    let name = "SpongeBob"
    return name
}

func getHighScores() async -> [Int] {
    let scores = [42, 23, 16, 15, 8, 4]
    return scores
}

func getFriends() async -> [String] {
    let friend = ["Sandy", "Patrick", "Squidward"]
    return friend
}

func printUserDetails() async {
    async let username = getUser()
    async let scores = getHighScores()
    async let friends = getFriends()

    let user = await UserData(name: username, friends: friends, highScores: scores)
    print("Hello, my name is \(user.name), and I have \(user.friends.count) friends!")
}
await printUserDetails()
