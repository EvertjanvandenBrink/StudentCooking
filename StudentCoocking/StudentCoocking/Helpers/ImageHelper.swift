//
//  ImageHelper.swift
//  StudentCoocking
//
//  Created by Jesper Menting on 09/04/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import UIKit

class ImageHelper {
    static var app: ImageHelper = {
        return ImageHelper()
    }()

    var imageCache = NSCache<AnyObject, AnyObject>()
    
    func getImage(urlString: String) -> UIImage? {
        return imageCache.object(forKey: urlString as AnyObject) as? UIImage;
    }
    
    func setImage(urlString: String, image: UIImage) {
        self.imageCache.setObject(image, forKey: urlString as AnyObject)
    }
    
}
