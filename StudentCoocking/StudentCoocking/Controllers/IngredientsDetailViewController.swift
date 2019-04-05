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
    @IBOutlet var descriptionView: UITextView!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateUI()
    }
    
    func updateUI() {
        nameLabel?.text = ingredient.strIngredient
        descriptionView?.text = ingredient.strDescription
        typeLabel?.text = ingredient.strType
        
        let ingredientName = ingredient.strIngredient.replacingOccurrences(of: " ", with: "-")
        let finalUrl = "\(ingredientName).png"
        
        if let url = URL(string: finalUrl) {
            TheMealDBService.shared.fetchImage(url: url) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.imageView?.image = image
                }
            }
        }
    }
}
