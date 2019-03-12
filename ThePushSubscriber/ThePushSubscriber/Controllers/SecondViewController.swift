//
//  SecondViewController.swift
//  ThePushSubscriber
//
//  Created by Evertjan van den Brink on 12/03/2019.
//  Copyright © 2019 Evertjan van den Brink. All rights reserved.
//

import UIKit
import Alamofire

class SecondViewController: UIViewController {
    var API_URL: String = "https://newsapi.org/v2"
    var API_KEY: String = "f03288f1a1cb47c9bf386e40cf4a867c"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        fetchAllHNItems()
        fetchTopHeadlines()
    }
    
    func fetchTopHeadlines() {
        Alamofire.request("https://newsapi.org/v2/top-headlines", parameters: ["country": "nl", "apiKey": "f03288f1a1cb47c9bf386e40cf4a867c"])
            .response { data in
                print(request)
                print(data)
        }
        //        Alamofire.request(getData(url: "top-headlines?country=nl")).responseData { (resData) -> Void in
//            print(resData.result.value!)
//        let strOutput = String(data : resData.result.value!, encoding : String.Encoding.utf8)
//            print(strOutput)
//        }
    }
    
    // With Alamofire
    func fetchAllHNItems() {
        guard let url = URL(string: getData(url: "top-headlines?country=nl")) else {
            return
        }
        Alamofire.request(url, method: .get)
//                          parameters: ["include_docs": "true"]
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching hackernews items: \(response.result.error)")
                    return
                }

                guard let value = response.result.value as? [String: Any],
                    let rows = value["rows"] as? [[String: Any]] else {
                        print("Malformed data received from fetchAllHNItems service")
                        return
                }
               
        }
    }
    
    func getData(url: String) -> String {
        return "\(API_URL)/\(url)&apiKey=\(API_KEY)";
    }
}
