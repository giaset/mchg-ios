//
//  FeedCollectionViewCell.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import AlamofireImage
import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeedCell"
    static let bottomSectionHeight: CGFloat = 105
    private let imageView = UIImageView()
    var listing: Listing? {
        didSet {
            setupForListing()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFit
        contentView.addSubviewForAutolayout(view: imageView)
        imageView.pinToSuperview(insets: UIEdgeInsets(top: 0, left: 0, bottom: FeedCollectionViewCell.bottomSectionHeight, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupForListing() {
        if let urlString = listing?.imageUrls?[0], let url = URL(string: urlString) {
            imageView.af_setImage(withURL: url, placeholderImage: UIImage.grailedPlaceholderImage, imageTransition: .crossDissolve(0.5))
        }
    }
}
