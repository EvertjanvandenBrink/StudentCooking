//
//  subscribedCategoriesCellView.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 08/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class subscribedCategoriesCellView: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(category: Category) {
        nameLabel.text = category.strCategory
        
        if let url = URL(string: category.strCategoryThumb) {
            TheMealDBService.shared.fetchImage(url: url) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.categoryImageView?.image = image
                }
            }
        }
    }
}
