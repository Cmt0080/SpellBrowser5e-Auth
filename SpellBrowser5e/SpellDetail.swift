//
//  SpellDetail.swift
//  SpellBrowser5e
//
//  Created by Connor Townsend on 4/5/26.
//

import Foundation

// Represents the full details of a single spell
struct SpellDetail: Codable {
    let index: String
    let name: String
    let level: Int
    let castingTime: String
    let range: String
    let duration: String
    let desc: [String]
    let school: SchoolReference

    enum CodingKeys: String, CodingKey {
        case index, name, level, range, duration, desc, school
        case castingTime = "casting_time"
    }
}

// The school field is a nested object like { "name": "Evocation" }
struct SchoolReference: Codable {
    let name: String
}
