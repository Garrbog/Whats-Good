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

                VStack(alignment: .leading, spacing: 4) {

                    if let topRestaurantId = user.topRestaurantId,
                       let place = mock.place(for: topRestaurantId) {
                        Text("Top restaurant: \(place.name)")
                    } else {
                        Text("Top restaurant: —")
                    }

                    Text("Top dish: \(user.topDish ?? "—")")
                    Text("Top drink: \(user.topDrink ?? "—")")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
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
