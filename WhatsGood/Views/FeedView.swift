//
//  FeedView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct FeedView: View {
    private let mock = MockDataService.shared

    var body: some View {
        NavigationStack {
            List {
                ForEach(mock.reviews) { review in
                    if
                        let user = mock.user(for: review.userId),
                        let place = mock.place(for: review.placeId)
                    {
                        NavigationLink {
                            PlaceDetailView(place: place)
                        } label: {
                            ReviewCard(review: review, user: user, place: place)
                        }
                        .buttonStyle(.plain)             // keeps it looking like a card
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Feed")
        }
    }
}

#Preview {
    FeedView()
}
