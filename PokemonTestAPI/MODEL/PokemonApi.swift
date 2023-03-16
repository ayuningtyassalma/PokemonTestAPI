//
//  PokemonApi.swift
//  PokemonTestAPI
//
//  Created by Phincon on 15/03/23.
//

import Foundation
struct PokemonApi: Codable {
    var results : [Results]
}

struct Results: Codable {
    var name : String
    var url : String
    
    enum CodingKeys : CodingKey {
       case name
        case url
    }
}


