//
//  FeedViewController.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GrailedStore.getListings(page: 1) { listings, error in
            for listing in listings ?? [] {
                print(listing.id)
            }
        }
    }
}
