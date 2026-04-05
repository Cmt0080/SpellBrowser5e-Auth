//
//  SpellViewModel.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import Foundation
import Combine

@MainActor
class SpellViewModel: ObservableObject {
    @Published var spells: [SpellSummary] = []
    @Published var selectedSpell: SpellDetail? = nil
    @Published var isLoading: Bool = false

    let baseURL = "https://www.dnd5eapi.co/api/2014"

    // Fetch the full list of spells
    func fetchSpells() async {
        isLoading = true
        guard let url = URL(string: "\(baseURL)/spells") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(SpellListResponse.self, from: data)
            spells = decoded.results
        } catch {
            print("Error fetching spells: \(error)")
        }

        isLoading = false
    }

    // Fetch detail for one spell by its index
    func fetchSpellDetail(index: String) async {
        guard let url = URL(string: "\(baseURL)/spells/\(index)") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(SpellDetail.self, from: data)
            selectedSpell = decoded
        } catch {
            print("Error fetching spell detail: \(error)")
        }
    }
}
