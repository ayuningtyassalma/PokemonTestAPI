//
//  MoreDetailsPokemonAPI.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 17/03/23.
//

import Foundation

struct MovePokemonAPI : Codable {
    var moves : [Moves]
    var name : String
    var baseExperience : Int
    //gambarnya
    var sprites : Sprites
    
    }

struct Moves : Codable {
    var move: Species
    enum CodingKeys: String, CodingKey {
        case move
        
    }
}
struct Species: Codable {
    let name: String
    let url: String
}

class Sprites: Codable {
    let backDefault, backFemale, backShiny, backShinyFemale: String
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }

    init(backDefault: String, backFemale: String, backShiny: String, backShinyFemale: String, frontDefault: String, frontFemale: String, frontShiny: String, frontShinyFemale: String) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
    }

}
