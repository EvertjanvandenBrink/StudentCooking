//
//  SubscriptionsHelperTests.swift
//  StudentCoockingTests
//
//  Created by Evertjan van den Brink on 10/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import XCTest
@testable import StudentCoocking

class SubscriptionsHelperTests: XCTestCase {
    
    override func setUp() {
    }
    
    override func tearDown() {
    }
    
    func test_addIngredientToSubscriptions() {
        let meal = Meal(strIngredient: "Butter", idIngredient: "1", strDescription: "This is butter!", strType: "")
        subscribedIngredients.append(meal)
        XCTAssertEqual(subscribedIngredients.count, 1)
    }
    
    func test_subscribedIngredientsContainsIngredient() {
        let meal = Meal(strIngredient: "Butter", idIngredient: "1", strDescription: "This is butter!", strType: "")
        subscribedIngredients.append(meal)
        
        XCTAssertEqual(SubscriptionsHelper.app.subscribedIngredientsContainsIngredient(meal), true)
    }
    
    func test_subscribedIngredientsDoesNotContainIngredient() {
        let meal = Meal(strIngredient: "Butter", idIngredient: "1", strDescription: "This is butter!", strType: "")
        let meal2 = Meal(strIngredient: "Apples", idIngredient: "2", strDescription: "This are eggs!", strType: "")
        
        subscribedIngredients.append(meal)
        
        XCTAssertEqual(SubscriptionsHelper.app.subscribedIngredientsContainsIngredient(meal2), false)
    }
    
    func test_deleteIngredientFromSubscribedIngredients() {
        let meal = Meal(strIngredient: "Butter", idIngredient: "1", strDescription: "This is butter!", strType: "")
        let meal2 = Meal(strIngredient: "Eggs", idIngredient: "2", strDescription: "This are eggs!", strType: "")
        
        subscribedIngredients.append(meal)
        subscribedIngredients.append(meal2)
        SubscriptionsHelper.app.deleteFromSubscribedIngredients(ingredient: meal)
        
        XCTAssertEqual(SubscriptionsHelper.app.subscribedIngredientsContainsIngredient(meal), false)
        XCTAssertEqual(SubscriptionsHelper.app.subscribedIngredientsContainsIngredient(meal2), true)
    }
}
