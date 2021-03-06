//
//  CategoriesDetailViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 05/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class CategoriesDetailViewController: UIViewController {
    var category:Category!
    
    @IBOutlet var descriptionView: UITextView!
    @IBOutlet var thumbmail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionView.isEditable = false
        
        updateUI()
    }
    
    func updateUI() {
        descriptionView?.text = category.strCategoryDescription
        self.title = category.strCategory
        
        if let url = URL(string: category.strCategoryThumb) {
            TheMealDBService.shared.fetchImage(url: url) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.thumbmail?.image = image
                }
            }
        }
    }
}
