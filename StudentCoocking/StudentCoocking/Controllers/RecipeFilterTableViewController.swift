//
//  RecipeFilterTableViewController.swift
//  Alamofire
//
//  Created by Jesper Menting on 08/04/2019.
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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
