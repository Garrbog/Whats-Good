//
//  MockData.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/23/26.
//

import Foundation

final class MockDataService {

    // MARK: - Shared
    static let shared = MockDataService()

    // MARK: - Places
    let places: [Place]

    // MARK: - Users
    let users: [User]

    // MARK: - Reviews
    let reviews: [Review]

    private init() {

        // Places
        let cafeRio = Place(
            id: UUID(),
            name: "Cafe Rio",
            averageRating: 4.2,
            ratingCount: 128,
            city: "Logan",
            latitude: 41.7355,
            longitude: -111.8344,
            address: "1300 N Main St",
            summary: "gwow, super bien.",
            category: "Mexican",
            priceLevel: 2,
            imageName: "fork.knife"
        )

        let angies = Place(
            id: UUID(),
            name: "Angie's",
            averageRating: 4.6,
            ratingCount: 342,
            city: "Logan",
            latitude: 41.7362,
            longitude: -111.8336,
            address: nil,
            summary: "itsa veryyyy agood place",
            category: "Restaurant",
            priceLevel: 2,
            imageName: "cup.and.saucer"
        )


        self.places = [cafeRio, angies]

        // Users
        let will = User(
            id: UUID(),
            firstName: "Talon",
            lastName: "Ford",
            username: "loserGuy",
            avatarSystemName: "person.circle.fill",
            favoriteRestaurantId: cafeRio.id
        )

        let emma = User(
            id: UUID(),
            firstName: "Ginger",
            lastName: "Ford",
            username: "ginny",
            avatarSystemName: "person.crop.circle",
            favoriteRestaurantId: nil
        )

        self.users = [will, emma]

        // Reviews
        self.reviews = [
            Review(
                id: UUID(),
                userId: will.id,
                placeId: cafeRio.id,
                text: "gwow, super bien.",
                rating: 4.5,
                date: Date().addingTimeInterval(-86400)
            ),
            Review(
                id: UUID(),
                userId: emma.id,
                placeId: angies.id,
                text: "Best breakfast in Logan, no contest.",
                rating: 5.0,
                date: Date().addingTimeInterval(-172800)
            )
        ]
    }

    // MARK: - Helpers
    func user(for id: UUID) -> User? {
        users.first { $0.id == id }
    }

    func place(for id: UUID) -> Place? {
        places.first { $0.id == id }
    }

    func reviewsForUser(_ userId: UUID) -> [Review] {
        reviews.filter { $0.userId == userId }
    }

    func reviewsForPlace(_ placeId: UUID) -> [Review] {
        reviews.filter { $0.placeId == placeId }
    }
}
