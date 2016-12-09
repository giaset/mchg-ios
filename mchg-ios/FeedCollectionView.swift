//
//  FeedCollectionView.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class FeedCollectionView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: FeedCollectionViewFlowLayout())
        backgroundColor = .white
        register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class FeedCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    private let padding: CGFloat = 5
    
    override init() {
        super.init()
        itemSize = calculateItemSize()
        minimumLineSpacing = padding
        sectionInset = UIEdgeInsets(top: 2, left: padding, bottom: 2, right: padding)
        minimumInteritemSpacing = padding
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func calculateItemSize() -> CGSize {
        let numberOfColumns = 2
        let screenWidth = UIScreen.main.bounds.width
        let totalPadding = CGFloat(numberOfColumns+1)*padding
        let aspectRatio = CGFloat(259.0/199.5) // as measured in Photoshop from a Grailed screenshot
        let width = (screenWidth-totalPadding)/CGFloat(numberOfColumns)
        return CGSize(width: width, height: (width*aspectRatio)+FeedCollectionViewCell.bottomSectionHeight)
    }
}
