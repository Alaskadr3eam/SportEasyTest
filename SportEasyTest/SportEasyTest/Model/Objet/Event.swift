//
//  Events.swift
//  SportEasyTest
//
//  Created by Clément Martin on 20/06/2021.
//

import Foundation

// MARK: - Event
struct Event: Codable {
    let events: [EventElement]
}

// MARK: - EventElement
struct EventElement: Codable {
    let leftTeam, rightTeam: TTeam
    let date, time: String

    enum CodingKeys: String, CodingKey {
        case leftTeam = "left_team"
        case rightTeam = "right_team"
        case date, time
    }
}

// MARK: - TTeam
struct TTeam: Codable {
    let name: String
    let score: Int
}
