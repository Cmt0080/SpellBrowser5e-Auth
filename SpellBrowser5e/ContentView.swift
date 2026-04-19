//
//  ContentView.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        if authViewModel.isLoggedIn {
            SpellListView(authViewModel: authViewModel)
        } else {
            LoginView(authViewModel: authViewModel)
        }
    }
}
#Preview {
    ContentView()
}
