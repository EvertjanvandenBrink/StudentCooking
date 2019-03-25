//
//  IngredientsTableViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let env = ApiEnvironment.production
        let context = NonPersistentApiContext(environment: env)
        let service = AlamofireIngredientService(context: context)
        service.getAllIngredients() { (ingredients, error) in
            if let error = error { return print(error.localizedDescription) }
            print("Found \(ingredients.count) ingredients:")
            ingredients.forEach { print("   \($0.name)") }
        }
    }
    
}
