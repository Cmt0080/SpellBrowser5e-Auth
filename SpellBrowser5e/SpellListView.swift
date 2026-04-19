//
//  SpellListView.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import SwiftUI

struct SpellListView: View {
    @StateObject var viewModel = SpellViewModel()
    @ObservedObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView("Loading Spells...")
            } else {
                List(viewModel.spells) { spell in
                    NavigationLink(destination: SpellDetailView(index: spell.index, viewModel: viewModel)) {
                        Text(spell.name)
                    }
                }
                .navigationTitle("D&D Spells")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Logout") {
                            authViewModel.logout()
                        }
                    }
                }
            }
        }
        .task {
            await viewModel.fetchSpells()
        }
    }
}

#Preview {
    SpellListView(authViewModel: AuthViewModel())
}
