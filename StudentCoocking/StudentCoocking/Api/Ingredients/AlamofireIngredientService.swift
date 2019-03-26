//
//  AlamofireIngredientService.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 25/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

class AlamofireIngredientService: AlamofireService, IngredientService {
    
    func getRandomIngredient(completion: @escaping IngredientResult) {
        get(at: .randomIngredient()).responseObject { (response: DataResponse<ApiIngredient>) in
            let result = response.result.value?.convert()
            completion(result, response.result.error)
        }
    }
    
    func getLatestIngredients(completion: @escaping IngredientsResult) {
        get(at: .latestIngredients()).responseArray { (response: DataResponse<[ApiIngredient]>) in
            let result = response.result.value?.map { $0.convert() }
            completion(result ?? [], response.result.error)
        }
    }
    
    func getAllIngredients(completion: @escaping IngredientsResult) {
        get(at: .allIngredients()) .responseArray { (response: DataResponse<[ApiIngredients]>) in
            print(response.result.value)
//            let result = response.result.value?.map { $0.convert() }
            print(response)
//            print(response.result.value)
//            completion(result ?? [], response.result.error)
        }
    }
}
