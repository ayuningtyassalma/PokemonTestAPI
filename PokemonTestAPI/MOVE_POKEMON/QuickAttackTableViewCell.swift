//
//  QuickAttackTableViewCell.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 17/03/23.
//

import UIKit

class QuickAttackTableViewCell: UITableViewCell {
    static let identifier = "QuickAttackTableViewCell"
    @IBOutlet weak var quickAttackLabel: UILabel!{
        didSet{
            quickAttackLabel.text = "Quick attack"
        }
    }
    
    
    @IBOutlet weak var quickAttackValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
}
