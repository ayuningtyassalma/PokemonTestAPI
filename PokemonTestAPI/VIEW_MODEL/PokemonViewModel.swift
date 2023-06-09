//
//  PokemonViewModel.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 15/03/23.
//

import Foundation

protocol PokemonApiProtocol {
    var urlString : String { get set }
    var bindPokemonData : ((PokemonApi?)->())? {get set}
    func fetchDataPokemon()
}

class PokemonViewModel: PokemonApiProtocol {
    private var apiService : ApiServiceProtocol? //ngmbil dari APISERVICE JD API SERVICE NYA DI BIKIN DLU
    var data : PokemonApi?
    var urlString: String = ""
    var bindPokemonData: ((PokemonApi?) -> ())?
    
    
    init(urlString: String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService
        
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
        
        fetchDataPokemon()
    }
    func fetchDataPokemon() {
        self.apiService?.callApi(model: PokemonApi?.self, completion: { response in
            switch response{
            case .success(let sucess):
                self.bindPokemonData?(sucess)
            case .failure(_):
                self.bindPokemonData?(nil)
            }
        })
    }
    
    }
