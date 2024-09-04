//
//  ApiResponse.swift
//  ProtocolDelegateDemo
//
//  Created by indus on 02/09/24.
//

import Foundation

struct ApiResponse: Codable {
    let id: Int
    let title: String?
    let price: Double
    let description: String?
    let category: String?
    let image: String?
    let rating: Rating
}
struct Rating: Codable {
    let rate: Double?
    let count: Int?
}
