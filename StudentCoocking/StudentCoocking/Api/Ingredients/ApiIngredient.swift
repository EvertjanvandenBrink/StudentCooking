//
//  Ingredients.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 25/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import ObjectMapper

class ApiIngredients {
    
    required public init?(map: Map) {}
    
    var ingredients = ""

    func convert() -> Ingredients {
        return Ingredients(
            ingredients: ingredients
        )
    }
}

class ApiIngredient {
    
    required public init?(map: Map) {}
    
    var id = ""
    var name = ""
    var description = ""
    var type = ""
    
    func convert() -> Ingredient {
        return Ingredient(
            id: id,
            name: name,
            description: description,
            type: type
        )
    }
}

// MARK: - Mappable

extension ApiIngredient: Mappable {
    
    func mapping(map: Map) {
        id <- map["idIngredient"]
        name <- map["strIngredient"]
        description <- map["strDescription"]
        type <- map["strType"]
    }
}

extension ApiIngredients: Mappable {
    
    func mapping(map: Map) {
        ingredients <- map["meals"]
    }
}
