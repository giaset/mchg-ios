//
//  FeedCollectionViewCell.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import AlamofireImage
import SwiftDate
import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FeedCell"
    static let bottomSectionHeight: CGFloat = 105
    
    private let imageView = UIImageView()
    private let timeLabel = UILabel()
    private let divider = UIView()
    private let titleLabel = UILabel()
    private let sizeLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
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
        
        timeLabel.font = UIFont.regularFont(size: 10)
        contentView.addSubviewForAutolayout(view: timeLabel)
        timeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        
        divider.backgroundColor = UIColor(hexString: "bfbfbf")
        contentView.addSubviewForAutolayout(view: divider)
        divider.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 8).isActive = true
        divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        sizeLabel.font = UIFont.semiboldFont(size: 14)
        contentView.addSubviewForAutolayout(view: sizeLabel)
        sizeLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5).isActive = true
        sizeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        titleLabel.font = UIFont.semiboldFont(size: 14)
        contentView.addSubviewForAutolayout(view: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: sizeLabel.leadingAnchor, constant: -5).isActive = true
        
        descriptionLabel.font = UIFont.regularFont(size: 12)
        contentView.addSubviewForAutolayout(view: descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        priceLabel.font = UIFont.boldFont(size: 14)
        contentView.addSubviewForAutolayout(view: priceLabel)
        priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupForListing() {
        if let urlString = listing?.imageUrls?[0], let url = URL(string: urlString) {
            imageView.af_setImage(withURL: url, placeholderImage: UIImage.grailedPlaceholderImage, imageTransition: .crossDissolve(0.5))
        }
        
        if let updatedAt = listing?.updatedAt, let colloquial = try? updatedAt.colloquialSinceNow().colloquial {
            timeLabel.text = colloquial.uppercased()
        } else {
            timeLabel.text = nil
        }
        
        titleLabel.text = listing?.designerNames?.uppercased()
        sizeLabel.text = listing?.size?.uppercased()
        descriptionLabel.text = listing?.title
        priceLabel.text = (listing?.price != nil) ? "$\(listing!.price!)" : nil
    }
}
