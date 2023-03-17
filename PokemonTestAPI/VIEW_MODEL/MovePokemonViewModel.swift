//
//  MoreDetailsPokemonViewModel.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 17/03/23.
//

import Foundation

protocol MoreDetailsPokemonProtocol {
    var urlString : String {get set}
    var bindMoreDetailPokemon : ((MovePokemonAPI?)->())? {get set}
    func fetchDataMoreDetailsPokemon()
}

class MovePokemonViewModel: MoreDetailsPokemonProtocol {
    private var apiService : ApiServiceProtocol?
    var urlString: String = ""
    
    var bindMoreDetailPokemon: ((MovePokemonAPI?) -> ())?
    
    
    init(urlString : String) {
        self.urlString = urlString
        self.apiService = ApiService()
        
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
        
        fetchDataMoreDetailsPokemon()
    }
    func fetchDataMoreDetailsPokemon() {
        self.apiService?.callApi(model: MovePokemonAPI?.self, completion: { response in
            switch response{
            case .success(let success):
                self.bindMoreDetailPokemon?(success)
            case .failure(let fail):
                self.bindMoreDetailPokemon?(nil)
            }
        })
    }
    
    
    
}
