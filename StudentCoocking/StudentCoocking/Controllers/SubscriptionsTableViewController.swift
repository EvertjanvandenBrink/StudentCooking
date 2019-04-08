//
//  FavouriteRecipesViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 04/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

var subscribedCategories: [Category] = []
class SubscriptionsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if subscribedCategories.count > 0 {
            self.updateUI(with: subscribedCategories)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if subscribedCategories.count > 0 {
            self.updateUI(with: subscribedCategories)
        }
    }
    
    func updateUI(with categories: [Category]) {
        DispatchQueue.main.async {
            subscribedCategories = categories
            self.tableView.reloadData()
            self.updateBadgeNumber()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscribedCategories.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionsIdentifier", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)
        return cell
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let category = subscribedCategories[indexPath.row]
        
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
        if segue.identifier == "CategoryDetailSegue" {
            let categoriesDetailViewController = segue.destination as! CategoriesDetailViewController
            let index = tableView.indexPathForSelectedRow!.row
            categoriesDetailViewController.category = subscribedCategories[index]
        }
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (action, indexPath) in
            let category = subscribedCategories[indexPath.row]
            Helper.app.deleteFromSubscriptions(category: category)
            self.updateUI(with: subscribedCategories)
        }
        deleteAction.backgroundColor = UIColor.red
        
        return [deleteAction]
    }
    
    private func updateBadgeNumber() {
        let badgeValue = subscribedCategories.count > 0 ? "\(subscribedCategories.count)" : nil
        navigationController?.tabBarItem.badgeValue = badgeValue
    }
}
