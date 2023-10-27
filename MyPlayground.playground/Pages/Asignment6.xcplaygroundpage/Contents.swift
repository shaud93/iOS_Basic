//: [Previous](@previous)

import Foundation

enum LoginError:Error{
    case acessDenied
    case dataNotFound
    case authicationFailed
    case general
}
func doLogin(email:String, password:String, statCode:Int){
    
    switch statCode {
    case 200:
        print("Login Succesfull")
    case 300...309:
        throw LoginError.acessDenied
    case:
        throw LoginError.dataNotFound
    default:
        throw Log
    }
}

//: [Next](@next)
