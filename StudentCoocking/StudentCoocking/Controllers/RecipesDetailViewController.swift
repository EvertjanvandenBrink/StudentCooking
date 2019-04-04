//
//  RecipesDetailViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class RecipesDetailViewController: UIViewController {
    var recipe:Recipe!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var tagsLabel: UILabel!
    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var thumbmail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        nameLabel?.text = recipe.strMeal
        categoryLabel?.text = recipe.strCategory
        tagsLabel?.text = recipe.strTags
        instructionsLabel?.text = recipe.strInstructions
        
        if let url = URL(string: recipe.strMealThumb!) {
            TheMealDBService.shared.fetchImage(url: url) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.thumbmail.image = image
                }
            }
        }
    }
}
