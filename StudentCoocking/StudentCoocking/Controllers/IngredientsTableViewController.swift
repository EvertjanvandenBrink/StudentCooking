//
//  IngredientsTableViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    
    var ingredients = [Meal]()
    var reloadData = false
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TheMealDBService().fetchAllIngredients(completionHandler: completionFetchAllIngredients)
    }
    
    func completionFetchAllIngredients(ingredients:  [Meal]?, error: Error?) {
        if let ingredients = ingredients {
            self.reloadData = true
            self.updateUI(with: ingredients)
        }
    }
    
    func updateUI(with ingredients: [Meal]) {
        DispatchQueue.main.async {
            self.ingredients = ingredients
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        
        if(count == self.ingredients.count && reloadData) {
            self.tableView.reloadData()
            self.count = 0
            self.reloadData = false
        }
        
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let ingredient = ingredients[indexPath.row]
        
        cell.textLabel?.text = ingredient.strIngredient
        
        count = count + 1
        
        let ingredientName = ingredient.strIngredient.replacingOccurrences(of: " ", with: "-")
        let finalUrl = "\(ingredientName).png"
        
        if let url = URL(string: finalUrl) {
            if let image: UIImage = ImageHelper.app.getImage(urlString: finalUrl) {
                cell.imageView?.image = image
            } else {
                TheMealDBService.shared.fetchImage(url: url) { (image) in
                    guard let image = image else { return }
                    DispatchQueue.main.async {
                        cell.imageView?.image = image
                        ImageHelper.app.setImage(urlString: finalUrl, image: image)
                    }
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IngredientsDetailSegue" {
            let ingredientsDetailViewController = segue.destination as! IngredientsDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            ingredientsDetailViewController.ingredient = ingredients[index]
        }
    }
}

