//
//  FeedCollectionView.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class FeedCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        backgroundColor = UIColor.red
        register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
