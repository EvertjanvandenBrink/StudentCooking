//
//  SubscriptionsViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 08/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

var subscribedCategories: [Category] = []
var subscribedIngredients: [Meal] = []
class SubscriptionsViewController: UIViewController {
    
    @IBOutlet weak var subscribedCategoriesTableView: UITableView!
    @IBOutlet weak var subscribedIngredientsTableView: UITableView!
    
    let subscribedCategoriesTableCellId = "subscribedCategoriesIdentifier"
    let subscribedIngredientsTableCellId = "subscribedIngredientsIdentifier"
    var recipesTableViewController: RecipesTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if subscribedCategories.count > 0 {
            updateUI(subscribedCategoriesTableView)
        }
        
        if subscribedIngredients.count > 0 {
            updateUI(subscribedIngredientsTableView)
        }
    }
    
    func callDelegates() {
        subscribedCategoriesTableView.delegate = self
        subscribedCategoriesTableView.dataSource = self
        
        subscribedIngredientsTableView.delegate = self
        subscribedIngredientsTableView.dataSource = self
    }
}

extension SubscriptionsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == subscribedCategoriesTableView {
            return subscribedCategories.count
        } else {
            return subscribedIngredients.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == subscribedCategoriesTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: subscribedCategoriesTableCellId, for: indexPath) as! subscribedCategoriesCellView
            let category = subscribedCategories[indexPath.row]
            cell.configureCell(category: category)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: subscribedIngredientsTableCellId, for: indexPath) as! subscribedIngredientsCellView
            let ingredient = subscribedIngredients[indexPath.row]
            cell.configureCell(ingredient: ingredient)
            return cell
        }
    }
    
    func completionFetchRecipes(recipes: [Recipe]?, error: Error?) {
        if let recipes = recipes {
            print("Recipes: \(recipes)")
            self.recipesTableViewController?.recipes = recipes
            
            self.recipesTableViewController?.reloadData = true
            self.recipesTableViewController?.updateUI(with: recipes)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipesTableViewWithCategorySegue" {
            self.recipesTableViewController = segue.destination as? RecipesTableViewController
            let index = subscribedCategoriesTableView.indexPathForSelectedRow!.row
            let categoryName = subscribedCategories[index].strCategory
            
            self.recipesTableViewController?.filter = categoryName
            TheMealDBService.shared.fetchFilterRecipeByCategory(category: categoryName, completionHandler:  completionFetchRecipes)
        } else if segue.identifier == "recipesTableViewWithIngredientSegue" {
            self.recipesTableViewController = segue.destination as? RecipesTableViewController
            let index = subscribedIngredientsTableView.indexPathForSelectedRow!.row
            let ingredientName = subscribedIngredients[index].strIngredient
            
            TheMealDBService.shared.fetchFilterRecipeByIngredient(ingredient: ingredientName, completionHandler: completionFetchRecipes)
        } 
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if tableView == subscribedCategoriesTableView {
            let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
                let category = subscribedCategories[indexPath.row]
                Helper.app.deleteFromSubscribedCategories(category: category)
                self.updateUI(self.subscribedCategoriesTableView)
            }
            deleteAction.backgroundColor = UIColor.red
            return [deleteAction]
        } else {
            let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
                let ingredient = subscribedIngredients[indexPath.row]
                Helper.app.deleteFromSubscribedIngredients(ingredient: ingredient)
                self.updateUI(self.subscribedIngredientsTableView)
            }
            deleteAction.backgroundColor = UIColor.red
            return [deleteAction]
        }
    }
    
    func updateUI(_ tableView: UITableView) {
        DispatchQueue.main.async {
            tableView.reloadData()
            self.updateBadgeNumber()
        }
    }
    
    private func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    private func updateBadgeNumber() {
        let categorySize = subscribedCategories.count > 0 ? subscribedCategories.count : 0
        let ingredientSize = subscribedIngredients.count > 0 ? subscribedIngredients.count : 0
        let total = categorySize + ingredientSize
        var badgeValue = total > 0 ? "\(total)" : "0"
        
        if (badgeValue.hasPrefix("0") && badgeValue.count > 1) {
            badgeValue.remove(at: badgeValue.startIndex)
        }
        
        navigationController?.tabBarItem.badgeValue = badgeValue
    }
}
