//
//  ApiEnvironment.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 25/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation

enum ApiEnvironment: String { case
    
    production = "https://www.themealdb.com/api/json/v1/1" //api key = 1
    
    
    var url: String {
        return rawValue
    }
}
