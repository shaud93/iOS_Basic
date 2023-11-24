//
//  YugiohModel.swift
//  Yugioh_dataBase
//
//  Created by D'Ante Watson on 11/16/23.
//

import Foundation

struct YugiohModel:Codable{
    
    var data : [YugiohData]
}

struct YugiohData:Codable {
    var id:Int
    var name:String
    var type:String
    var frameType:String
    var desc:String
    var atk:Int?
    var def:Int?
    var level:Int?
    var race:String
    var attribute:String?
    var archetype:String?
    var card_sets:[CardSet]?
    var card_images:[CardImages]
    var card_prices:[CardPrices]
}

struct CardSet:Codable {
    var set_name:String
    var set_code:String
    var set_rarity:String
    var set_rarity_code:String
    var set_price:String
}

struct CardImages:Codable {
    var id:Int
    var image_url:String
    var image_url_small:String
    var image_url_cropped:String
}

struct CardPrices:Codable {
    var cardmarket_price:String
    var tcgplayer_price:String
    var ebay_price:String
    var amazon_price:String
    var coolstuffinc_price:String
}
