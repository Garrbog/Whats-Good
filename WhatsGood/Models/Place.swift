//
//  Place.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/23/26.
//

import Foundation

struct Place: Identifiable {
    let id: UUID
    let name: String
    let averageRating: Double
    let ratingCount: Int
    
    let city: String
    let latitude: Double
    let longitude: Double
    let address: String?
    
    let summary: String
    let category: String
    let priceLevel: Int
    let imageName: String
}
