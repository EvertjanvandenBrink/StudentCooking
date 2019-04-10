//
//  SubscriptionsHelper.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 10/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import UIKit

class SubscriptionsHelper {
    static var app: SubscriptionsHelper = {
        return SubscriptionsHelper()
    }()
   
    func subscribedCategoriesContainsCategory(_ category: Category) -> Bool {
        var match = false
        subscribedCategories.forEach{ element in
            if element == category {
                match = true
            }
        }
        return match
    }
    
    func subscribedIngredientsContainsIngredient(_ ingredient: Meal) -> Bool {
        var match = false
        subscribedIngredients.forEach{ element in
            if element == ingredient {
                match = true
            }
        }
        return match
    }
    
    func deleteFromSubscribedCategories(category: Category) {
        subscribedCategories.forEach{ element in
            subscribedCategories = subscribedCategories.filter(){$0 != category}
        }
    }
    
    func deleteFromSubscribedIngredients(ingredient: Meal) {
        subscribedIngredients.forEach{ element in
            subscribedIngredients = subscribedIngredients.filter(){$0 != ingredient}
        }
    }
}
