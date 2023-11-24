//
//  YugiohList.swift
//  Yugioh_dataBase
//
//  Created by D'Ante Watson on 11/16/23.
//

import Foundation
class YugiohList {
    static let sharedInstance = YugiohList()
    
     var cardList = [YugiohData]()
    
    private init(cardList: [YugiohData] = [YugiohData]()) {
        self.cardList = cardList
    }
}
