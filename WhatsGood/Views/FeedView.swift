//
//  FeedView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct FeedView: View {
    private let mock = MockDataService.shared
    @State private var path: [Route] = []
    
    enum Route: Hashable {
        case profile(UUID)
        case place(UUID)
    }
    var body: some View {
            NavigationStack(path: $path) {
                List {
                    ForEach(mock.reviews) { review in
                        if
                            let user = mock.user(for: review.userId),
                            let place = mock.place(for: review.placeId)
                        {
                            ReviewCard(
                                review: review,
                                user: user,
                                place: place,
                                onUserTap: { path.append(.profile(user.id)) },
                                onPlaceTap: { path.append(.place(place.id)) }
                            )
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Feed")
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .profile(let userId):
                        if let u = mock.user(for: userId) {
                            ProfileView(user: u)
                        } else {
                            Text("User not found")
                        }

                    case .place(let placeId):
                        if let p = mock.place(for: placeId) {
                            PlaceDetailView(place: p)
                        } else {
                            Text("Place not found")
                        }
                    }
                }
            }
        }
    }
#Preview {
    FeedView()
}
