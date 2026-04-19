//
//  SpellBrowser5eApp.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import SwiftUI
import FirebaseCore

@main
struct SpellBrowser5eApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
