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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TheMealDBService().fetchRandomRecipe(completionHandler: completionFetchRandomRecipe)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameLabel?.text = self.recipe.strMeal
    }
    
    func completionFetchRandomRecipe(meals: Meals?, error: Error?) {
        self.recipe = meals?.meals[0]
    }
}
