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
    var baseExperience : Int?
    let stats: [Stat]
    //gambarnya
    var sprites : Sprites
    
    var hp: Int {
        for stat in stats {
            if stat.stat.name == "hp"{
                return stat.baseStat
            }
            
        }
        return 0
    }
    enum CodingKeys: String, CodingKey {
        case moves, name, sprites, stats
        case baseExperience = "base_experience"
    }
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

struct Sprites: Codable {
    let frontDefault : String

    enum CodingKeys: String, CodingKey {
 case frontDefault = "front_default"}
    
}


struct Stat: Codable {
    let baseStat: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }

//    init(backDefault: String, backFemale: String, backShiny: String, backShinyFemale: String, frontDefault: String, frontFemale: String, frontShiny: String, frontShinyFemale: String) {
//        self.backDefault = backDefault
//        self.backFemale = backFemale
//        self.backShiny = backShiny
//        self.backShinyFemale = backShinyFemale
//        self.frontDefault = frontDefault
//        self.frontFemale = frontFemale
//        self.frontShiny = frontShiny
//        self.frontShinyFemale = frontShinyFemale
//    }

}
