//
//  IngredientsDetailViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 03/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class IngredientsDetailViewController: UIViewController {
    var ingredient:Meal!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        nameLabel?.text = ingredient.strIngredient
        descriptionLabel?.text = ingredient.strDescription
        typeLabel?.text = ingredient.strType
    }
}
