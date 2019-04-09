//
//  RecipesTableViewController.swift
//  StudentCoocking
//
//  Created by Jesper Menting on 02/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    static let shared = RecipesTableViewController()
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var recipes = [Recipe]()
    var filter: String = ""
    var imageCache = NSCache<AnyObject, AnyObject>()
    
    func completionFetchRecipes(recipes: [Recipe]?, error: Error?) {
        if let recipes = recipes {
            self.updateUI(with: recipes)
        }
    }
    
    @IBAction func filterClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "popoverSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCache.name = "Recipe image cache"
        TheMealDBService.shared.fetchLatestMeals(completionHandler: completionFetchRecipes)
    }

    func updateUI(with recipes: [Recipe]) {
        DispatchQueue.main.async {
            self.recipes = recipes
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let recipe = recipes[indexPath.row]
        
        cell.textLabel?.text = recipe.strMeal
        
        if let url = URL(string: recipe.strMealThumb!) {
            if let image: UIImage = imageCache.object(forKey: recipe.strMealThumb! as AnyObject) as? UIImage {
                cell.imageView?.image = image
            } else {
                TheMealDBService.shared.fetchImage(url: url) { (image) in
                    guard let image = image else { return }
                    DispatchQueue.main.async {
                        if let currentIndexPath = self.tableView.indexPath(for: cell),
                            currentIndexPath != indexPath {
                            return
                        }
                        cell.imageView?.image = image
                        self.imageCache.setObject(image, forKey: recipe.strMealThumb as AnyObject)
                        self.tableView.reloadRows(at: [self.tableView.indexPath(for: cell)!], with: UITableView.RowAnimation.automatic)
                    }
                }
            }
        }
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let recipesDetailViewController = storyBoard.instantiateViewController(withIdentifier: "recipesDetailViewController") as! RecipesDetailViewController
        recipesDetailViewController.recipe = recipes.randomElement()
        
        self.dismiss(animated: true, completion: nil)
        self.present(recipesDetailViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RecipesDetailSegue" {
            let recipesDetailViewController = segue.destination as! RecipesDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            recipesDetailViewController.recipe = recipes[index]
        }
        
        if segue.identifier == "popoverSegue" {
            let recipeFilterTableViewController = segue.destination as! RecipeFilterTableViewController
            recipeFilterTableViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            recipeFilterTableViewController.popoverPresentationController!.delegate = self as? UIPopoverPresentationControllerDelegate
            recipeFilterTableViewController.filter = self.filter
            recipeFilterTableViewController.completionHandler = {(categorySelected : String?) in
                if let category = categorySelected
                {
                    self.filter = category
                    
                    TheMealDBService.shared.fetchFilterRecipeByCategory(category: self.filter, completionHandler: self.completionFetchRecipes)
                }
            }
        }
    }
        
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let addToFavouritesAction = UITableViewRowAction(style: .normal, title: "Favorite") { (action, indexPath) in
            let recipe = self.recipes[indexPath.row]
            self.addToFavourites(recipe: recipe)
        }
        addToFavouritesAction.backgroundColor = UIColor.green
        
        return [addToFavouritesAction]
    }
    
    func addToFavourites(recipe: Recipe) {
        if Helper.app.favouriteRecipesContainsRecipe(recipe) {
            self.showAlert(title: "Alert!", message: "Recipe is already a favourite!")
        } else {
            favouriteRecipes.append(recipe)
            self.showAlert(title: "Alert!", message: "Recipe is added to favourites!")
        }
    }
}
