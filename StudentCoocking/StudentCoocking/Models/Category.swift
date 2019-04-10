//
//  Category.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 05/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [Category]
}

struct Category: Codable {
    let idCategory, strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

extension Category: Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.idCategory == rhs.idCategory &&
            lhs.strCategory == rhs.strCategory
    }
}
