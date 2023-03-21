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
    var delegate :  MoreDetailsPokemonProtocol?
    
    
//    init(urlString : String) {
//        self.urlString = urlString
//        self.apiService = ApiService()
//
//        if let url = URL(string: urlString){
//            self.apiService?.get(url: url)
//        }
    init(urlString : String, apiService: ApiServiceProtocol) {
        self.urlString = urlString
        self.apiService = apiService as? ApiService
        if let url = URL(string: urlString){
            self.apiService?.get(url: url)
        }
//        fetchDataMoreDetailsPokemon()
    }
    func fetchDataMoreDetailsPokemon() {
        self.apiService?.callApi(model: MovePokemonAPI?.self, completion: { response in
            print("Response")
            print(response)
            switch response{
            case .success(let success):
                print("success")
                print(success)
                self.bindMoreDetailPokemon?(success)
//                print("success")
            case .failure(_):
                print("error")
                self.bindMoreDetailPokemon?(nil)
            }
        })
    }
    
    
    
}
