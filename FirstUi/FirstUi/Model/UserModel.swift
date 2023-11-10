//
//  UserModel.swift
//  FirstUi
//
//  Created by D'Ante Watson on 11/2/23.
//

import Foundation

struct UserModel:Decodable {
    let page:Int
    let per_page:Int
    let total:Int
    let total_pages:Int
    let data:[User]
    let support:Support
}

struct User:Decodable {
    let id:Int
    let email:String
    let first_name:String
    let last_name:String
    let avatar:String
}

struct Support:Decodable {
    let url:String
    let text:String
}
