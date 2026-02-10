//
//  ReviewCardView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/23/26.
//

import SwiftUI

struct ReviewCard: View {
    let review: Review
    let user: User
    let place: Place
    let onUserTap: () -> Void
    let onPlaceTap:() -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // Top Row: Avatar + username (tappable) + place (tappable)
            HStack(alignment: .center, spacing: 10) {
                Button(action: onUserTap) {
                        HStack(spacing: 10) {
                            Image(systemName: user.avatarSystemName)
                                .font(.system(size: 34))

                            Text(user.fullName)
                                .font(.headline)
                        }
                    }
                    .buttonStyle(.plain)

                    Button(action: onPlaceTap) {
                        Text(place.name)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)

                    Spacer()
                }
            
            // Stars + date
            HStack(spacing: 8) {
                StarRatingView(rating: review.rating)
                
                Text(review.date, style: .date)
                
                Spacer()
            }
            
            // Review Text
            Text(review.text)
                .font(.body)
                .foregroundStyle(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .background(.thinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct StarRatingView: View {
    let rating: Double

    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { i in
                Image(systemName: starName(for: i))
                    .font(.caption)
            }
        }
        .accessibilityLabel("Rating \(rating) out of 5")
    }

    private func starName(for index: Int) -> String {
        let value = Double(index) + 1.0
        if rating >= value { return "star.fill" }
        if rating >= value - 0.5 { return "star.leadinghalf.filled" }
        return "star"
    }
}

#Preview {
    // Tiny preview mock objects so the file previews
    let place = Place(
        id: UUID(),
        name: "Angie's",
        averageRating: 4.6,
        ratingCount: 342,
        city: "Logan",
        latitude: 0,
        longitude: 0,
        address: nil,
        summary: "Breakfast spot.",
        category: "Restaurant",
        priceLevel: 2,
        imageName: "cup.and.saucer"
    )
    
    let user = User(
        id: UUID(),
        firstName: "Will",
        lastName: "Ford",
        username: "willf",
        avatarSystemName: "person.circle.fill",
        favoriteRestaurantId: nil
    )
    
    let review = Review(
        id: UUID(),
        userId: user.id,
        placeId: place.id,
        text: "So good. Would 100% come back.",
        rating: 4.5,
        date: Date()
    )
    
    ReviewCard(
        review: review,
        user: user,
        place: place,
        onUserTap: {},
        onPlaceTap: {}
    )
    .padding()
}
