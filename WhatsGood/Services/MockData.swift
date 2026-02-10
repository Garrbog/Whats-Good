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
    
    // MARK: - Comments
    let comments: [Comment]

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
            firstName: "Will",
            lastName: "Ford",
            username: "Garrbog",
            avatarSystemName: "person.circle.fill",
            location: "Logan, UT",
            bio: "I like tacos.",
            topRestaurantId: cafeRio.id,
            topDish: "Sweet pork burrito",
            topDrink: "Horchata",
            restaurantsVisitedCount: 12,
            followerIds: [],
            followingIds: []
        )


        let emma = User(
            id: UUID(),
            firstName: "Emma",
            lastName: "Lenhart",
            username: "lenny1844",
            avatarSystemName: "person.circle",
            location: "Logan, UT",
            bio: "I love bevs",
            topRestaurantId: angies.id,
            topDish: "pancakes",
            topDrink: "Dr. Pepper",
            restaurantsVisitedCount: 18,
            followerIds: [],
            followingIds: []
        )


        self.users = [will, emma]

        // Reviews
        let review1 = Review(
            id: UUID(),
            userId: will.id,
            placeId: cafeRio.id,
            text: "gwow, super bien.",
            rating: 4.5,
            date: Date().addingTimeInterval(-86400),
            likedByUserIds: [],
            commentCount: 2
        )

        let review2 = Review(
            id: UUID(),
            userId: emma.id,
            placeId: angies.id,
            text: "Best breakfast in Logan, no contest.",
            rating: 5.0,
            date: Date().addingTimeInterval(-172800),
            likedByUserIds: [],
            commentCount: 0
        )

        self.reviews = [review1, review2]
        
        self.comments = [
            Comment(
                id: UUID(),
                reviewId: review1.id,
                userId: emma.id,
                text: "Was it busy when you went?",
                date: Date().addingTimeInterval(-3600)
            ),
            Comment(
                id: UUID(),
                reviewId: review1.id,
                userId: will.id,
                text: "Not really—maybe a 10 min wait.",
                date: Date().addingTimeInterval(-1800)
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
    
    func commentsForReview(_ reviewId: UUID) -> [Comment] {
        comments.filter { $0.reviewId == reviewId }
    }

}
