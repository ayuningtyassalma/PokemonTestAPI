//
//  MovePokemonViewController.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 17/03/23.
//

import UIKit
import SDWebImage

enum pokemonInSection : Int{
//    case header
    case heroname = 0
    case moves = 1
    case quickAttack = 2
    case moreMoveDetail = 3
    
    }

class MovePokemonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    var urlString: String = ""
    
    var bindMoreDetailPokemon: ((MovePokemonAPI?) -> ())?
    
    var listPoke: Results?
    
    
    var movePokemonviewModel : MovePokemonViewModel?
    static let identifier = "MovePokemonViewController"
    @IBOutlet weak var tableView: UITableView!
    var moveUrl: String?
    private var movePokemonApiList : MovePokemonAPI?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignBackground()
        registerTableView()
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Your Hero"
    }
    
    func assignBackground(){
        let background = UIImage(named: "waves-background-2")
        var image : UIImageView!
        image = UIImageView(frame: view.bounds)
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = false
        image.image = background
        
        view.addSubview(image)
        self.view.sendSubviewToBack(image)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.view.topAnchor),
            image.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            image.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            image.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        
        ])
        tableView.backgroundColor = .clear
    }
    
    func setUpViewModel(){
//        guard let moveUrl = moveUrl else { return  }
//        movePokemonviewModel = MovePokemonViewModel()
        self.movePokemonviewModel = MovePokemonViewModel(urlString: listPoke?.url ?? "", apiService: ApiService())
//        movePokemonviewModel?.delegate = self
        self.movePokemonviewModel?.bindMoreDetailPokemon = {
            pokemonMoveDetailModel in
            if let data = pokemonMoveDetailModel {
                self.movePokemonApiList = data
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        movePokemonviewModel?.fetchDataMoreDetailsPokemon()
    }
    
    func registerTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: HeroNameTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HeroNameTableViewCell.identifier)
        tableView.register(UINib(nibName: MovePokemonTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovePokemonTableViewCell.identifier)
        tableView.register(UINib(nibName: QuickAttackTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: QuickAttackTableViewCell.identifier)
        tableView.register(UINib(nibName: MoreDetailsMoveTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MoreDetailsMoveTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
        return 1
        case 1:
//            return movePokemonApiList?.moves.count ?? 0
        return 1
        case 2:
//            return movePokemonApiList?.moves.count ?? 0
            return 1
        case 3:
            return movePokemonApiList?.moves.count ?? 0
//        return 1
        default:
            break
        }
       return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sections = pokemonInSection(rawValue: indexPath.section)
        switch sections {
        case .heroname:
            return 100
        case .moves:
            return 250
        case .quickAttack:
            return 100
        case .moreMoveDetail:
            return 100
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sections = pokemonInSection(rawValue: indexPath.section)
        switch sections {
        case .heroname:
            guard let heroNameCell = tableView.dequeueReusableCell(withIdentifier: HeroNameTableViewCell.identifier, for: indexPath) as? HeroNameTableViewCell else { return UITableViewCell() }
            heroNameCell.heroNameLabel.text = movePokemonApiList?.name
            heroNameCell.hpLabel.text = "\(movePokemonApiList?.hp ?? 0) HP"
            return heroNameCell
            
        case .moves:
            guard let moveCell = tableView.dequeueReusableCell(withIdentifier: MovePokemonTableViewCell.identifier, for: indexPath)as? MovePokemonTableViewCell else { return UITableViewCell() }
//            moveCell.nameLabel.text = movePokemonApiList?.name
//            moveCell.baseExperienceLabel.text = "\(movePokemonApiList?.baseExperience ?? 0)"
            moveCell.spritesIMG.sd_setImage(with:URL(string: (movePokemonApiList?.sprites.frontDefault) ?? ""))
            return moveCell
            
        case .quickAttack:
        guard let  quickAttackCell = tableView.dequeueReusableCell(withIdentifier: QuickAttackTableViewCell.identifier, for: indexPath)as? QuickAttackTableViewCell else { return UITableViewCell() }
//            quickAttackCell.quickAttackLabel.text = self.movePokemonApiList?.moves[indexPath.row].move.name
            quickAttackCell.quickAttackValue.text = "\(movePokemonApiList?.baseExperience ?? 0)"
        return quickAttackCell
            
        case .moreMoveDetail:
            guard let moreMoveDetail = tableView.dequeueReusableCell(withIdentifier: MoreDetailsMoveTableViewCell.identifier, for: indexPath) as? MoreDetailsMoveTableViewCell else { return UITableViewCell() }
            moreMoveDetail.moveName.text = self.movePokemonApiList?.moves[indexPath.row].move.name
//            moreMoveDetail.movePower.text = self.movePokemonApiList?.moves[indexPath.row].move
            return moreMoveDetail
        default:
            break
        }
        return UITableViewCell()
    }

}
