//
//  ProductModel.swift
//  CoreDataExample
//
//  Created by D'Ante Watson on 11/23/23.
//

import Foundation
struct Product: Decodable{
    var products: [ProductData]
    var total, skip, limit: Int
}

// MARK: - Product
struct ProductData: Decodable{
    var id: Int
    var title, description: String
    var price: Int
    var discountPercentage, rating: Double
    var stock: Int
    var brand, category: String
    var thumbnail: String
    var images: [String]
}
