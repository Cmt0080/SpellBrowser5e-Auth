//
//  SpellListView.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import SwiftUI

struct SpellListView: View {
    @StateObject var viewModel = SpellViewModel()

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
            }
        }
        .task {
            await viewModel.fetchSpells()
        }
    }
}
