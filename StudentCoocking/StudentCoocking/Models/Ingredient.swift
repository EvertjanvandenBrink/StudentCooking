//
//  IngredientsModel.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

//struct Ingredients {
//    let ingredients: [Ingredient]
//}

struct Ingredient {
    let id: String
    let name: String
    let description: String?
    let type: String?
}

typealias IngredientResult = (_ ingredient: Ingredient?, _ error: Error?) -> ()
typealias IngredientsResult = (_ ingredients: [Ingredient], _ error: Error?) -> ()

protocol IngredientService: class {
    
    func getRandomIngredient(completion: @escaping IngredientResult)
    func getLatestIngredients(completion: @escaping IngredientsResult)
    func getAllIngredients(completion: @escaping IngredientsResult)
}



struct Ingredients {
    let ingredients: String
}

typealias MealResult = (_ meal: Ingredient?, _ error: Error?) -> ()
typealias MealsResult = (_ meals: [Ingredient], _ error: Error?) -> ()

protocol MealsIngredientService: class {
    
    func getRandomIngredient(completion: @escaping IngredientResult)
    func getLatestIngredients(completion: @escaping IngredientsResult)
    func getAllIngredients(completion: @escaping IngredientsResult)
}
