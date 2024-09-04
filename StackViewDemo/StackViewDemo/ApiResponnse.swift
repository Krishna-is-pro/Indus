//
//  ApiResponnse.swift
//  StackViewDemo
//
//  Created by indus on 31/08/24.
//

import Foundation


struct ApiResponnses: Codable {
    let products: [products]
    let total, skip, limit: Int
}

// MARK: - Product
struct products: Codable {
    let id: Int
    let title, description: String
    let category: String
    let price, discountPercentage: Double
    let brand: String = ""
    let images: [String]
    let thumbnail: String
    let tags : [String]
    
}


