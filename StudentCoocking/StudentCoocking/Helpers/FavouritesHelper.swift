//
//  FavouritesHelper.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 10/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import UIKit

class FavouritesHelper {
    static var app: FavouritesHelper = {
        return FavouritesHelper()
    }()
    
    func favouriteRecipesContainsRecipe(_ recipe: Recipe) -> Bool {
        var match = false
        favouriteRecipes.forEach{ element in
            if element == recipe {
                match = true
            }
        }
        return match
    }
    
    func deleteFromFavourites(recipe: Recipe) {
        favouriteRecipes.forEach{ element in
            favouriteRecipes = favouriteRecipes.filter(){$0 != recipe}
        }
    }
}
