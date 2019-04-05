//
//  Helper.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 05/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static var app: Helper = {
        return Helper()
    }()
    
    let backgroundColor = UIColor.white
    let primaryColor = UIColor.white
    
    func favouriteRecipesContainsRecipe(_ recipe: Recipe) -> Bool {
        for i in 0..<favouriteRecipes.count {
            if favouriteRecipes[i].strMeal == recipe.strMeal {
                return true
            }
        }
        return false
    }
    
    func deleteFromFavourites(recipe: Recipe) {
        for i in 0..<favouriteRecipes.count {
            if favouriteRecipes[i].strMeal == recipe.strMeal {
                favouriteRecipes.remove(at: i)
            }
        }
    }
}
