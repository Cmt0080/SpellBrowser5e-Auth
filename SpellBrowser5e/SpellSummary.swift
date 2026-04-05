//
//  SpellSummary.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import Foundation
// Represents One spell on the list
struct SpellSummary: Codable, Identifiable {
    var id: String {index}
    let index: String
    let name: String
    let url: String
}

// Wrapper
struct SpellListResponse: Codable {
    let results: [SpellSummary]
}
