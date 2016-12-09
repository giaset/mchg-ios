//
//  FeedCollectionView.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class FeedCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout {
    
    private let padding: CGFloat = 5
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        delegate = self
        backgroundColor = .white
        register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: FeedCollectionViewCell.identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfColumns = 2
        let screenWidth = UIScreen.main.bounds.width
        let totalPadding = CGFloat(numberOfColumns+1)*padding
        let aspectRatio = CGFloat(259.0/199.5)
        let width = (screenWidth-totalPadding)/CGFloat(numberOfColumns)
        return CGSize(width: width, height: width*aspectRatio)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return padding;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: padding, bottom: 2, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return padding
    }
}
