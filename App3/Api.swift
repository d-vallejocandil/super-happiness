//
//  Api.swift
//  App3
//
//  Created by Turno Mananas on 23/11/2026.
//

import Foundation

class Api {
    static let baseUrl = "https://www.freetogame.com/api/"
    static func getGames() async -> [Game] {
        guard let url = URL(string: "\(Api.baseUrl)games") else {
            print("Error")
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([Game].self, from: data)
        } catch {
            print("Error")
            return []
        }
    }
    static func getGame(id: Int) async -> Game? {
        guard let url = URL(string: "\(Api.baseUrl)game?id=\(id)") else {
            print("Error")
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(Game.self, from: data)
        } catch {
            print("Error")
            return nil
        }
    }
}
