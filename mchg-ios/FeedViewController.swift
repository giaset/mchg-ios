//
//  FeedViewController.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDataSource {
    
    private let feedCollectionView = FeedCollectionView()
    private var listings: [Listing]? {
        didSet {
            feedCollectionView.reloadData()
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        feedCollectionView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GrailedStore.getListings(page: 1) { listings, error in
            self.listings = listings
        }
        
        view.addSubviewForAutolayout(view: feedCollectionView)
        feedCollectionView.pinToSuperview()
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listings?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath)
    }
}
