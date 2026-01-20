//
//  AppState.swift
//  WhatsGood
//
//  Created by William Garrett Ford on 1/19/26.
//

import Foundation // Foundation is Apples core util framework for Dates, URLs, file handling, JSON encoding, Timers, etc
import Combine  // Apples reactive/state framework

@MainActor
final class AppState: ObservableObject {   // Observable goes with Combine

    enum AuthStatus {    // Our two allowed states
        case loggedOut
        case loggedIn
    }

    @Published var authStatus: AuthStatus = .loggedIn   // This part updates the UI when the user logs in or out
}

