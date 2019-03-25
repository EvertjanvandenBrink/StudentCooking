//
//  ApiRoute.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 25/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation

enum ApiRoute { case
    
    auth,
    randomIngredient(),
    latestIngredients(),
    allIngredients()
    
    var path: String {
        switch self {
        case .auth: return "auth"
        case .randomIngredient(): return "random.php"
        case .latestIngredients(): return "latest.php"
        case .allIngredients(): return "list.php?i=list"
        }
    }
    
    func url(for environment: ApiEnvironment) -> String {
        return "\(environment.url)/\(path)"
    }
}
