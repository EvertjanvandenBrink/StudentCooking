//
//  Array+Extensions.swift
//  StudentCoocking
//
//  Created by Evertjan van den Brink on 25/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation

// This will be used for the shuffle device
extension Array {
    func shuffled() -> Array {
        var array = self
        for _ in 0..<array.count {
            array.sort(by: { (_,_) in arc4random() < arc4random() })
        }
        
        return array
    }
}
