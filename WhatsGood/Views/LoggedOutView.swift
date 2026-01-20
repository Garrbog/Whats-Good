//
//  LoggedOutView.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

struct LoggedOutView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack(spacing: 16) {
            Text("You are logged out.").font(.title2)
            Button("Log in (fake)") {
                appState.authStatus = .loggedIn
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    LoggedOutView()
        .environmentObject(AppState())
}
