//
//  HeroNameTableViewCell.swift
//  PokemonTestAPI
//
//  Created by Phincon on 21/03/23.
//

import UIKit

class HeroNameTableViewCell: UITableViewCell {
    static let identifier = "HeroNameTableViewCell"
    
    @IBOutlet weak var heroNameLabel: UILabel!
    
    @IBOutlet weak var hpLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
