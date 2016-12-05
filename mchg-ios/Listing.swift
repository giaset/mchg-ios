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
    
    init(json: [String: Any]) {
        if let id = json["id"] as? Int {
            self.id = String(id)
        }
    }
}
