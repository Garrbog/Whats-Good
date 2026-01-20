//
//  WhatsGoodApp.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import SwiftUI

@main
struct WhatsGoodApp: App {
    @StateObject private var appState = AppState()  // This is from our AppState under Services to update UI if user is logged in/out
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(appState)
        }
    }
}
