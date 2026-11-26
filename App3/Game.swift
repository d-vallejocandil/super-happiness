//
//  Game.swift
//  App3
//
//  Created by Turno Mananas on 23/11/2026.
//

struct Game: Codable {
    let id: Int
    let title: String
    let thumbnail: String
    let short_description: String
    let genre: String
    let platform: String
    let publisher: String
    let developer: String
    let description: String?
    let screenshots: [Screenshot]?
}

struct Screenshot: Codable {
    let image: String
}
