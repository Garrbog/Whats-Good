//
//  PlaceDetailView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/23/26.
//

import SwiftUI

struct PlaceDetailView: View {
    private let mock = MockDataService.shared
    let place: Place

    private var reviewsForPlace: [Review] {
        mock.reviewsForPlace(place.id)
    }

    var body: some View {
        List {
            Section {
                Text(place.name).font(.title2).bold()
                Text(place.category).foregroundStyle(.secondary)
                Text(place.city).foregroundStyle(.secondary)
            }

            Section("Reviews") {
                ForEach(reviewsForPlace) { review in
                    if let user = mock.user(for: review.userId) {
                        ReviewCard(
                            review: review,
                            user: user,
                            place: place,
                            onUserTap: {},
                            onPlaceTap: {}
                        )
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle(place.name)
    }
}

#Preview {
    PlaceDetailView(place: Place(
        id: UUID(),
        name: "Demo Place",
        averageRating: 4.2,
        ratingCount: 100,
        city: "Logan",
        latitude: 0,
        longitude: 0,
        address: nil,
        summary: "Demo summary",
        category: "Restaurant",
        priceLevel: 2,
        imageName: "fork.knife"
    ))
}
