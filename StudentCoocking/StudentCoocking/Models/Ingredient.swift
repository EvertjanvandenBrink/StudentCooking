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
import Foundation

struct Ingredients: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let strIngredient, idIngredient: String
    let strDescription, strType: String?
}

extension Meal: Equatable {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        return lhs.idIngredient == rhs.idIngredient &&
            lhs.strIngredient == rhs.strIngredient
    }
}
