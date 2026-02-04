//
//  PokemonData.swift
//  PokeStats
//
//  Created by Cem Akkaya on 04/02/26.
//

import Foundation

// Main packet from API
struct PokemonData: Codable {
    let name: String
    let id: Int
    let sprites: Sprites
    let stats: [Stats]
}

// Contents of the 'sprites' box
struct Sprites: Codable {
    let front_default: String
}

struct Stats: Codable {
    let base_stat: Int
}
