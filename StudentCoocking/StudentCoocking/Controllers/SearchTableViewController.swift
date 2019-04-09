//
//  SearchTableViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 04/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    var recipes = [Recipe]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var recipesTableView: UITableView!
    
    func completionFetchRecipesBySearchTerm(recipes: [Recipe]?, error: Error?) {
        if let recipes = recipes {
            self.updateUI(with: recipes)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchTerm = searchBar.text!
        
        TheMealDBService.shared.fetchSearchTerm(searchTerm: searchTerm, completionHandler: completionFetchRecipesBySearchTerm)
        searchBar.showsCancelButton.toggle()
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
            recipesDetailViewController.recipe = recipes[index]
        }
    }
}
