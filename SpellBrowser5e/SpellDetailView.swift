//
//  SpellDetailView.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import SwiftUI

struct SpellDetailView: View {
    let index: String
    @ObservedObject var viewModel: SpellViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let spell = viewModel.selectedSpell {
                    Text(spell.name)
                        .font(.largeTitle)
                        .bold()

                    Text("School: \(spell.school.name)")
                        .font(.headline)

                    Text("Level: \(spell.level == 0 ? "Cantrip" : "Level \(spell.level)")")
                    Text("Casting Time: \(spell.castingTime)")
                    Text("Range: \(spell.range)")
                    Text("Duration: \(spell.duration)")

                    Divider()

                    Text("Description")
                        .font(.headline)

                    ForEach(spell.desc, id: \.self) { paragraph in
                        Text(paragraph)
                    }
                } else {
                    ProgressView("Loading...")
                }
            }
            .padding()
        }
        .navigationTitle("Spell Detail")
        .task {
            await viewModel.fetchSpellDetail(index: index)
        }
    }
}
