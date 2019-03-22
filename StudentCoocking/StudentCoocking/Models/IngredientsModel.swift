//
//  IngredientsModel.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

struct Ingredients: Codable {
    let ingredients: [Ingredient]
}

struct Ingredient: Codable {
    let idIngredient, strIngredient: String
    let strDescription, strType: String?
}
