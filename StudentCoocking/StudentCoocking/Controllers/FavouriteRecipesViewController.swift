//
//  FavouriteRecipesViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 04/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

var favouriteRecipes: [Recipe] = []
class FavouriteRecipesViewController: UITableViewController {
    static let shared = FavouriteRecipesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if favouriteRecipes.count > 0 {
            self.updateUI(with: favouriteRecipes)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        if favouriteRecipes.count > 0 {
            self.updateUI(with: favouriteRecipes)
        }
    }
    
    func updateUI(with recipes: [Recipe]) {
        DispatchQueue.main.async {
            favouriteRecipes = recipes
            self.tableView.reloadData()
            self.updateBadgeNumber()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteRecipes.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favouriteRecipesIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let recipe = favouriteRecipes[indexPath.row]
        
        cell.textLabel?.text = recipe.strMeal
        if let url = URL(string: recipe.strMealThumb!) {
            TheMealDBService.shared.fetchImage(url: url) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    if let currentIndexPath = self.tableView.indexPath(for: cell),
                        currentIndexPath != indexPath {
                        return
                    }
                    cell.imageView?.image = image
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipesDetailSegue" {
            let recipesDetailViewController = segue.destination as! RecipesDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            recipesDetailViewController.recipe = favouriteRecipes[index]
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            let recipe = favouriteRecipes[indexPath.row]
            Helper.app.deleteFromFavourites(recipe: recipe)
            self.updateUI(with: favouriteRecipes)
        }
        deleteAction.backgroundColor = UIColor.red
        
        let viewDetailsAction = UITableViewRowAction(style: .normal, title: "View details") { (action, indexPath) in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let recipesDetailViewController = storyBoard.instantiateViewController(withIdentifier: "recipesDetailViewController") as! RecipesDetailViewController
            recipesDetailViewController.recipe = favouriteRecipes[indexPath.row]
            
            self.dismiss(animated: true, completion: nil)
            self.present(recipesDetailViewController, animated: true, completion: nil)
        }
        viewDetailsAction.backgroundColor = UIColor.blue
        
        return [deleteAction, viewDetailsAction]
    }
    
    private func updateBadgeNumber() {
        let badgeValue = favouriteRecipes.count > 0 ? "\(favouriteRecipes.count)" : nil
        navigationController?.tabBarItem.badgeValue = badgeValue
    }
}
