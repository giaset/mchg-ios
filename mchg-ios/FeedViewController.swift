//
//  FeedViewController.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-04.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let refreshControl = UIRefreshControl()
    private let feedCollectionView = FeedCollectionView()
    private var listings: [Listing]? {
        didSet {
            feedCollectionView.reloadData()
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "G R A I L E D"
        refreshControl.addTarget(self, action: #selector(fetchListings), for: .valueChanged)
        feedCollectionView.refreshControl = refreshControl
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListings()
        
        view.addSubviewForAutolayout(view: feedCollectionView)
        feedCollectionView.pinToSuperview()
    }
    
    private var page = 1
    private var fetching = false
    func fetchListings(reset: Bool = true) {
        if fetching { return }
        fetching = true
        page = reset ? 1 : page+1
        GrailedStore.getListings(page: page) { listings, error in
            self.fetching = false
            self.refreshControl.endRefreshing()
            if reset {
                self.listings = listings
            } else if let newListings = listings {
                self.listings?.append(contentsOf: newListings)
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listings?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCollectionViewCell.identifier, for: indexPath)
        (cell as? FeedCollectionViewCell)?.listing = listings?[indexPath.row]
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.bounds.size.height
        let position = scrollView.contentOffset.y+scrollViewHeight
        let triggerPoint = scrollView.contentSize.height-(scrollViewHeight/2) // trigger when we are half a screen from bottom
        if position > triggerPoint {
            fetchListings(reset: false)
        }
    }
}
