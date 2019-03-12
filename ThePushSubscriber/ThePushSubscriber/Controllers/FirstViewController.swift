//
//  FirstViewController.swift
//  ThePushSubscriber
//
//  Created by Evertjan van den Brink on 12/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
    }
}
