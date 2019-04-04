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
    let baseURL = URL(string: "https://www.themealdb.com/")!
    
    static let shared = TheMealDBService()
    
    init() {}

    func fetchLatestMeals(completionHandler: @escaping ([Recipe]?, Error?) -> ()) {
        // /lookup.php?i=52772
        Alamofire.request(getData(url: "latest.php")).responseJSON { (response) -> Void in
            switch response.result {
            case .success(_):
                    guard let meals = try? JSONDecoder().decode(Meals.self, from: response.data!) else {
                        print("Error: Couldn't decode data into Blog")
                        return
                    }
                    completionHandler(meals.meals, nil)
                case .failure(let error):
                    completionHandler(nil, error)
            }
        }
    }

    func fetchAllIngredients(completionHandler: @escaping ([Meal]?, Error?) -> Void) {
        Alamofire.request(getData(url: "list.php?i=list")).responseJSON { (response) -> Void in
            switch response.result {
            case .success(_):
                guard let ingredients = try? JSONDecoder().decode(Ingredients.self, from: response.data!) else {
                    print("Error: Couldn't decode data into Blog")
                    return
                }
                completionHandler(ingredients.meals, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        var finalURL = url
        if (!url.absoluteString.contains("https")) {
            finalURL = TheMealDBService.shared.baseURL
            finalURL = finalURL.appendingPathComponent("images")
            finalURL = finalURL.appendingPathComponent("ingredients")
            finalURL = finalURL.appendingPathComponent(url.absoluteString)
        }
        
        let task = URLSession.shared.dataTask(with: finalURL) { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func getData(url: String) -> String {
        return "\(API_URL)/\(API_KEY)/\(url)";
    }
}
