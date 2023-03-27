//
//  MovePokemonTableViewCell.swift
//  PokemonTestAPI
//
//  Created by Salma Ayu on 17/03/23.
//

import UIKit

class MovePokemonTableViewCell: UITableViewCell {
    static let identifier = "MovePokemonTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var baseExperienceLabel: UILabel!
    
    @IBOutlet weak var frameView: UIView!{
        didSet{
            frameView.backgroundColor = UIColor.black.withAlphaComponent(0)
        }
    }
    
    @IBOutlet weak var spritesIMG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    
}
