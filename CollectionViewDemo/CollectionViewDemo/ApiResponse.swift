//
//  ApiResponse.swift
//  CollectionViewDemo
//
//  Created by indus on 22/08/24.
//

import Foundation
struct ApiResponse : Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let reviews: [Review]
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
}
// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double?
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: String
    let barcode: String?
    let qrCode: String?
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: String
    let reviewerName, reviewerEmail: String
}
