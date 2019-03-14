//
//  HackerNewsService.swift
//  ThePushSubscriber
//
//  Created by Evertjan van den Brink on 14/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import Foundation
import Alamofire

class HackerNewsService {
    var API_URL: String = "https://newsapi.org/v2"
    var API_KEY: String = "f03288f1a1cb47c9bf386e40cf4a867c"
    
    init() {}
    
    func fetchTopHeadlines() {
        Alamofire.request(getData(url: "top-headlines?country=nl")).responseJSON { (resData) -> Void in
            print(resData.result.value!)
        }
    }
    
    func fetchAllItems() {
        Alamofire.request(getData(url: "everything?sources=nl")).responseJSON { (resData) -> Void in
            print(resData.result.value!)
        }
    }
    
    func getData(url: String) -> String {
        return "\(API_URL)/\(url)&apiKey=\(API_KEY)";
    }
}
