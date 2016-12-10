//
//  Listing.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import Foundation

class Listing {
    
    var id: String?
    var imageUrls: [String]?
    var designerNames: String?
    var size: String?
    var title: String?
    var price: Int?
    
    init(json: [String: Any]) {
        if let id = json["id"] as? Int {
            self.id = String(id)
        }
        
        if let photos = json["photos"] as? [[String: Any]] {
            imageUrls = photos.flatMap{$0["url"] as? String}
        }
        
        designerNames = json["designer_names"] as? String
        size = json["size"] as? String
        if size == "one size" {
            size = "OS"
        }
        title = json["title"] as? String
        price = json["price"] as? Int
    }
}
