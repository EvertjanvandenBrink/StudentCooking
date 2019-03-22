//
//  TheMealDBService.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import Alamofire

class TheMealDBService {
    var API_KEY: String = "1"
    var API_URL: String = "https://www.themealdb.com/api/json/v1"
    
    init() {}
    
    func fetchLatestMeals() {
        // /lookup.php?i=52772
        Alamofire.request(getData(url: "latest.php")).responseJSON { (resData) -> Void in
            print(resData.result.value!)
        }
    }
    
    func fetchAllIngredients() {
        Alamofire.request(getData(url: "list.php?i=list")).responseJSON { (resData) -> Void in
            print(resData.result.value!)
        }
    }
    
    func fetchRandomMeal() {
        Alamofire.request(getData(url: "random.php")).responseJSON { (resData) -> Void in
            print(resData.result.value!)
            do {
                let ingredients = try JSONDecoder().decode(Ingredients.self, from: resData.data as! Data) // Decoding our data
                print("decoded ingredients")
                print(ingredients) // decoded!!!!!
            } catch {
                print("JSONSerialization error:", error)
            }
        }
    }
    
    func getData(url: String) -> String {
        return "\(API_URL)/\(API_KEY)/\(url)";
    }
}
