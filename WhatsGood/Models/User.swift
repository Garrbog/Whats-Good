//
//  File.swift
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

    let favoriteRestaurantId: UUID?

    var fullName: String { "\(firstName) \(lastName)" }
}
