//
//  ProfileView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    private let mock = MockDataService.shared

    private var userReviews: [Review] {
        mock.reviewsForUser(user.id)
    }

    var body: some View {
        List {
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

            Section("Reviews") {
                ForEach(userReviews) { review in
                    if let place = mock.place(for: review.placeId) {
                        ReviewCard(
                            review: review,
                            user: user,
                            place: place,
                            onUserTap: {},
                            onPlaceTap: {}
                        )
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("Profile")
    }
}

#Preview {
    let user = MockDataService.shared.users[0]
    ProfileView(user: user)
}
