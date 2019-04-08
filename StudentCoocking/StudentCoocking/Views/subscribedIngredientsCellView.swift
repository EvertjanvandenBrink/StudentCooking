//
//  subscribedIngredientsCellView.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 08/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class subscribedIngredientsCellView: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredientImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(ingredient: Meal) {
        nameLabel.text = ingredient.strIngredient
        
        let ingredientName = ingredient.strIngredient.replacingOccurrences(of: " ", with: "-")
        let finalUrl = "\(ingredientName).png"
        
        if let url = URL(string: finalUrl) {
            TheMealDBService.shared.fetchImage(url: url) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.ingredientImageView?.image = image
                }
            }
        }
    }
}
