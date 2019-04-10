//
//  CategoriesTableViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 05/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    var categories = [Category]()
    
    func completionFetchAllCategories(categories: [Category]?, error: Error?) {
        if let categories = categories {
            self.updateUI(with: categories)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TheMealDBService.shared.fetchAllCategories(completionHandler: completionFetchAllCategories)
    }
    
    func updateUI(with categories: [Category]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.strCategory
        if let url = URL(string: category.strCategoryThumb) {
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
        if segue.identifier == "CategoriesDetailSegue" {
            let categoriesDetailViewController = segue.destination as! CategoriesDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            categoriesDetailViewController.category = categories[index]
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let subscribeOnCategoryAction = UITableViewRowAction(style: .normal, title: "Subscribe") { (action, indexPath) in
            let category = self.categories[indexPath.row]
            self.subscribeOnCategory(category: category)
        }
        subscribeOnCategoryAction.backgroundColor = UIColor.blue
    
        return [subscribeOnCategoryAction]
    }
    
    func subscribeOnCategory(category: Category) {
        if SubscriptionsHelper.app.subscribedCategoriesContainsCategory(category) {
            self.showAlert(title: "Alert!", message: "You have already subscribed on \(category.strCategory)!")
        } else {
            subscribedCategories.append(category)
            self.showAlert(title: "Alert!", message: "\(category.strCategory) is added to your subscriptions!")
        }
    }
}
