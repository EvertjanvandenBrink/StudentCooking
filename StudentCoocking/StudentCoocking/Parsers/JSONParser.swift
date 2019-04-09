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
    var recipesTableViewController: RecipesTableViewController?
    
    private func readLocalJsonFile() -> JSON {
        let path = Bundle.main.path(forResource: "codes", ofType: "json")!
        let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let jsonDict = JSON(parseJSON: jsonString!)
        
        return jsonDict["codes"]
    }
    
    func getIngredientNameByCode(code: String) -> String {
        let ingredients = readLocalJsonFile()
        
        for (_, object) in ingredients {
            if object["id"].stringValue == code {
                return object["ingredientName"].stringValue
            }
        }
        return ""
    }

    func showRecipesByRecognisedIngredient(code: String) {
        print(code)
        let ingredient = getIngredientNameByCode(code: code)
        
        if ingredient != "" {
            TheMealDBService.shared.fetchFilterRecipeByIngredient(ingredient: ingredient, completionHandler: completionFetchRecipes)
        }
    }
    
    func completionFetchRecipes(recipes: [Recipe]?, error: Error?) {
        if let recipes = recipes {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let recipesTableViewController: RecipesTableViewController = storyBoard.instantiateViewController(withIdentifier: "recipesTableViewController") as! RecipesTableViewController
            recipesTableViewController.recipes = recipes
            recipesTableViewController.reloadData = true
            recipesTableViewController.updateUI(with: recipes)
            
            ScannerViewController.shared.navigationController?.pushViewController(recipesTableViewController, animated: true)
            ScannerViewController.shared.dismiss(animated: true, completion: nil)
        }
    }
}
