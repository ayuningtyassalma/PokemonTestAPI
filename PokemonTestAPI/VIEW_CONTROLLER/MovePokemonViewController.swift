//
//  MovePokemonViewController.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 17/03/23.
//

import UIKit

enum pokemonInSection : Int{
    case header
    case moves
    
//    init(section : Int) {
////        switch section {
////        case <#pattern#>:
////            <#code#>
////        default:
////            <#code#>
////        }
//    }
}

class MovePokemonViewController: UIViewController {
    var movePokemonviewModel : MovePokemonViewModel?
    static let identifier = "MovePokemonViewController"
    @IBOutlet weak var tableView: UITableView!
    var moveUrl: String?
    private var movePokemonApiList : MovePokemonAPI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.viewModel = MovePokemonViewModel(urlString: <#T##String#>, apiService: <#T##ApiServiceProtocol#>)
        setUpViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Pokemon"
    }
    
    func setUpViewModel(){
        guard let moveUrl = moveUrl else { return  }
//        movePokemonviewModel = MovePokemonViewModel()
        movePokemonviewModel = MovePokemonViewModel(urlString: moveUrl)
//        movePokemonviewModel?.delegate.self
        
    }
    
    

}
