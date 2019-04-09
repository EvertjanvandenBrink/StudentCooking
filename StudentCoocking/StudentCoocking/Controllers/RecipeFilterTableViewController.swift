//
//  RecipeFilterTableViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 09/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class RecipeFilterTableViewController: UITableViewController {
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    var categories = [Category]()
    var checkedCategoryIndex = -1
    var completionHandler: ((String?)->(Void))?
    var filter: String = ""
    
    func completionFetchCategories(categories: [Category]?, error: Error?) {
        if let categories = categories {
            self.updateUI(with: categories)
        }
    }
    
    func updateUI(with categories: [Category]) {
        DispatchQueue.main.async {
            self.categories = categories
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TheMealDBService.shared.fetchAllCategories(completionHandler: completionFetchCategories)
        backButton.action = #selector(onBackButtonClicked)
        
        if(self.filter != "") {
            for i in 0..<self.categories.count {
                if(self.categories[i].strCategory == self.filter) {
                    self.checkedCategoryIndex = i
                }
            }
        }
    }
    
    @objc func onBackButtonClicked() {
        self.dismiss(animated: true, completion: {[weak self] in
            if let handler = self?.completionHandler
            {
                if(self?.checkedCategoryIndex != -1) {
                    handler(self?.categories[(self?.checkedCategoryIndex)!].strCategory)
                } else if(self?.filter != "") {
                    handler(self?.filter)
                } else {
                    handler("")
                }
            }
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterIdentifier", for: indexPath)
        cell.textLabel?.text = self.categories[indexPath.row].strCategory
        
        if(self.filter != "" && self.filter == self.categories[indexPath.row].strCategory) {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(self.checkedCategoryIndex != -1) {
            tableView.visibleCells[self.checkedCategoryIndex].accessoryType = UITableViewCell.AccessoryType.none
        }
        
        if(self.checkedCategoryIndex != indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }
        
        self.checkedCategoryIndex = indexPath.row
    }
    
}
