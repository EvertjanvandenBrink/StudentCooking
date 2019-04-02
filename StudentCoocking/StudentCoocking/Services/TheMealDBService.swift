//
//  TheMealDBService.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TheMealDBService {
    var API_KEY: String = "1"
    var API_URL: String = "https://www.themealdb.com/api/json/v1"

    init() {}

    func fetchLatestMeals(completionHandler: @escaping (Meals?, Error?) -> ()) {
        // /lookup.php?i=52772
        Alamofire.request(getData(url: "latest.php")).responseJSON { (response) -> Void in
            switch response.result {
            case .success(_):
                    guard let meal = try? JSONDecoder().decode(Meals.self, from: response.data!) else {
                        print("Error: Couldn't decode data into Blog")
                        return
                    }
                    completionHandler(meal, nil)
                case .failure(let error):
                    completionHandler(nil, error)
            }
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
        }
    }

    func getData(url: String) -> String {
        return "\(API_URL)/\(API_KEY)/\(url)";
    }
}
