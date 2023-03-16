//
//  ViewController.swift
//  PokemonTestAPI
//
//  Created by Phincon on 15/03/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
   

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel : PokemonViewModel?
    private var pokemonApiList:  PokemonApi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerCollcetionView()
        self.viewModel = PokemonViewModel(urlString: "https://pokeapi.co/api/v2/pokemon", apiService: ApiService())
        
        self.viewModel?.bindPokemonData = { pokemonListModel in
            print("this is the data: \(pokemonListModel)")
            if let dataAja = pokemonListModel {
                self.pokemonApiList = dataAja
                
//                self.collectionView.backgroundColor = .blue
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
    }
    
    func setUpPokemonCellFlowLayout() -> UICollectionViewLayout{
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        flowlayout.sectionInset = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
        flowlayout.minimumInteritemSpacing = 12
        
        let screenSize = self.view.bounds.size.width - flowlayout.sectionInset.left - flowlayout.sectionInset.right - flowlayout.minimumInteritemSpacing
        
        flowlayout.itemSize = CGSize(width: screenSize / 2, height: 250)
        
        return flowlayout
    }
    
    func registerCollcetionView() {
        collectionView.collectionViewLayout = setUpPokemonCellFlowLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "PokemonCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonApiList?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCollectionViewCell", for: indexPath) as? PokemonCollectionViewCell else{
                return UICollectionViewCell()
            }
        cell.imageView.sd_setImage(with:URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png"))
            cell.pokemonNameLabel.text = pokemonApiList?.results[indexPath.row].name
        cell.containerView.layer.borderWidth = 1
        cell.containerView.layer.borderColor = UIColor.black.cgColor

        return cell
        }
        
    }
    
//cara add package

// 1. file -> add packages/swift packages -> copy paste url nya -> janlup di import
// contoh; mau add packages SDWebImage, copy paste url nya di add packages abs itu diimport sdwebimage



