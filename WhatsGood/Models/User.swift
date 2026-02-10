//
//  User.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/23/26.
//
import Foundation

struct User: Identifiable {
    let id: UUID
    let firstName: String
    let lastName: String
    let username: String
    let avatarSystemName: String

    let location: String? // "Logan, UT"
    let bio: String?
    
    let topRestaurantId: UUID?
    let topDish: String?
    let topDrink: String?
    
    let restaurantsVisitedCount: Int
    let followerIds: [UUID]
    let followingIds: [UUID]

    var fullName: String { "\(firstName) \(lastName)" }
}
