//
//  ProfileView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct ProfileView: View {
    // 1) Grab the mock data “database”
    private let mock = MockDataService.shared

    // 2) Choose which user this profile is for (Phase 1: hardcode first user)
    private var user: User { mock.users[0] }

    // 3) Pull this user’s reviews
    private var userReviews: [Review] { mock.reviewsForUser(user.id) }

    var body: some View {
        NavigationStack {
            List {
                // 4) Profile header section
                Section {
                    HStack(spacing: 12) {
                        Image(systemName: user.avatarSystemName)
                            .font(.system(size: 46))

                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullName)
                                .font(.title3).bold()
                            Text("@\(user.username)")
                                .foregroundStyle(.secondary)
                        }

                        Spacer()
                    }
                    .padding(.vertical, 6)

                    // 5) Optional favorite restaurant display
                    if let favId = user.favoriteRestaurantId,
                       let favPlace = mock.place(for: favId) {
                        Text("Favorite: \(favPlace.name)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    } else {
                        Text("Favorite: —")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }

                // 6) Reviews section
                Section("Reviews") {
                    ForEach(userReviews) { review in
                        // 7) Look up the Place for each review
                        if let place = mock.place(for: review.placeId) {
                            ReviewCard(review: review, user: user, place: place)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
