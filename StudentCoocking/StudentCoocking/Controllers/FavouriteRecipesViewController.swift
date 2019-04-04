//
//  FavouriteRecipesViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 04/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class FavouriteRecipesViewController: UITableViewController {
    static let shared = FavouriteRecipesViewController()
    
    var favouriteRecipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in viewDidLoad!")
        print(favouriteRecipes.count)
        print(favouriteRecipes)
        
        if favouriteRecipes.count > 0 {
            self.updateUI(with: favouriteRecipes)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("in viewDidAppear!")
        print(favouriteRecipes.count)
        print(favouriteRecipes)
        
        if favouriteRecipes.count > 0 {
            self.updateUI(with: favouriteRecipes)
        }
    }
    
    func addToFavourite(_ recipe: Recipe) {
        if favouriteRecipesContainsRecipe(recipe) {
            print("Recipe is already a favourite!")
        } else {
            self.favouriteRecipes.append(recipe)
            print("\(recipe) is added to favourites!")
        }
        
        print(self.favouriteRecipes.count)
        print(recipe.strMeal!)
    }
    
    func deleteFromFavourites(recipe: Recipe) {
        for i in 0..<favouriteRecipes.count {
            if favouriteRecipes[i].strMeal == recipe.strMeal {
               favouriteRecipes.remove(at: i)
            }
        }
    }
    
    func updateUI(with recipes: [Recipe]) {
        DispatchQueue.main.async {
            self.favouriteRecipes = recipes
            self.tableView.reloadData()
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
    
    private func favouriteRecipesContainsRecipe(_ recipe: Recipe) -> Bool {
        for i in 0..<favouriteRecipes.count {
            if favouriteRecipes[i].strMeal == recipe.strMeal {
                return true
            }
        }
        return false
    }
}
