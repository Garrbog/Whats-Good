//
//  SwiftUIView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct AppRootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        switch appState.authStatus {
        case .loggedOut:
            LoggedOutView()
        case .loggedIn:
            MainTabView()
        }
    }
}

#Preview {
    AppRootView()
        .environmentObject(AppState())
}

