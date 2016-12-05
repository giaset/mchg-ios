//
//  GrailedStore.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import Alamofire
import Foundation

class GrailedStore {
    
    class func getListings(page: Int, completion: @escaping (([Listing]?, Error?) -> Void )) {
        Alamofire.request("https://www.grailed.com/api/listings/grailed?page=\(page)").responseJSON { response in
            if let error = response.result.error {
                completion(nil, error)
                return
            }
            
            if let json = response.result.value as? [String: Any], let jsonData = json["data"] as? [[String: Any]] {
                var listings = [Listing]()
                for listingJson in jsonData {
                    listings.append(Listing(json: listingJson))
                }
                completion(listings, nil)
            }
        }
    }
}
