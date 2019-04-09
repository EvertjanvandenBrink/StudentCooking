//
//  JSONParser.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 09/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONParser {
    static let shared = JSONParser()
    var ingredient: String?
    
    func addIngredientToSubscriptions(code: String) {
        self.ingredient = getIngredientNameByCode(code: code)
        
        if self.ingredient != "" {
            TheMealDBService.shared.fetchAllIngredients(completionHandler: completionFetchAllIngredients)
        }
    }
    
    func completionFetchAllIngredients(ingredients:  [Meal]?, error: Error?) {
        if let ingredients = ingredients {
            for element in ingredients {
                if element.strIngredient == self.ingredient {
                    subscribeOnIngredient(ingredient: element)
                }
            }
        }
    }
    
    func subscribeOnIngredient(ingredient: Meal) {
        if !Helper.app.subscribedIngredientsContainsIngredient(ingredient) {
            subscribedIngredients.append(ingredient)
        }
    }
    
    private func readLocalJsonFile() -> JSON {
        let path = Bundle.main.path(forResource: "codes", ofType: "json")!
        let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let jsonDict = JSON(parseJSON: jsonString!)
        
        return jsonDict["codes"]
    }
    
    private func getIngredientNameByCode(code: String) -> String {
        let ingredients = readLocalJsonFile()
        
        for (_, object) in ingredients {
            if object["id"].stringValue == code {
                return object["ingredientName"].stringValue
            }
        }
        return ""
    }
}
