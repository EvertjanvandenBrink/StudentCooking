//
//  SecondViewController.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 22/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var app_name: UILabel!
    @IBOutlet weak var reset_app: UISwitch!
    @IBOutlet weak var version_number: UILabel!
    @IBOutlet weak var build_number: UILabel!
    @IBOutlet weak var creators: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerSettingsBundle()
        updateDisplayFromDefaults()
        NotificationCenter.default.addObserver(self, selector: #selector(SettingsViewController.defaultsChanged), name: UserDefaults.didChangeNotification, object: nil)
        defaultsChanged()
    }
    
    func registerSettingsBundle(){
        let appDefaults = [String:AnyObject]()
        UserDefaults.standard.register(defaults: appDefaults)
    }
    
    func updateDisplayFromDefaults() {
        let defaults = UserDefaults.standard
        
        if (defaults.string(forKey: "app_name") != nil) {
            app_name.text = defaults.string(forKey: "app_name")
        } else {
            app_name.text = "StudentCooking"
        }
        reset_app.isOn = defaults.bool(forKey: "RESET_APP_KEY")
        version_number.text = defaults.string(forKey: "version_preference")
        build_number.text = defaults.string(forKey: "build_preference")
        if (defaults.string(forKey: "creators") != nil) {
            creators.text = defaults.string(forKey: "creators")
        } else {
            creators.text = "J. Menting & E. v.d Brink"
        }
    }
    
    @objc func defaultsChanged(){
        // add functionality to change defaults....
    }
}
