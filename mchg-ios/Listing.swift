//
//  Listing.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import Foundation

class Listing {
    
    private let dateFormatter = DateFormatter()
    
    var id: String?
    var imageUrls: [String]?
    var createdAt: Date?
    var updatedAt: Date?
    var designerNames: String?
    var size: String?
    var title: String?
    var price: Int?
    
    init(json: [String: Any]) {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let id = json["id"] as? Int {
            self.id = String(id)
        }
        
        if let photos = json["photos"] as? [[String: Any]] {
            imageUrls = photos.flatMap{$0["url"] as? String}
        }
        
        if let createdAt = json["created_at"] as? String {
            self.createdAt = dateFormatter.date(from: createdAt)
        }
        
        if let updatedAt = json["price_updated_at"] as? String {
            self.updatedAt = dateFormatter.date(from: updatedAt)
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
