//
//  Review.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/23/26.
//

import Foundation

struct Review: Identifiable {
    let id: UUID
    let userId: UUID
    let placeId: UUID
    
    let text: String
    let rating: Double
    let date: Date
    
    var likedByUserIds: Set<UUID>
    var commentCount: Int
}
