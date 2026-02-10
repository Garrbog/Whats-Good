//
//  MainTabView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem { Label("Feed", systemImage: "house")}
            
            MapView()
                .tabItem { Label("Map", systemImage: "map")}
            
            ReviewView()
                .tabItem { Label("Reveiw", systemImage: "star")}
            
            ProfileView(user: MockDataService.shared.users[0])
                .tabItem { Label("Profile", systemImage: "person")}
        }
    }
}

#Preview {
    MainTabView()
}
