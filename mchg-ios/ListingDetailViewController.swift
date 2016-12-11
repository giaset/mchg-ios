//
//  ListingDetailViewController.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-11.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

class ListingDetailViewController: UIViewController {
    
    private let listing: Listing
    
    private let scrollView = UIScrollView()
    private let carrousel = UIScrollView()
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let priceLabel = UILabel()
    private let descriptionHeaderLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init(listing: Listing) {
        self.listing = listing
        super.init(nibName: nil, bundle: nil)
        title = listing.designerNames?.uppercased()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubviewForAutolayout(view: scrollView)
        scrollView.pinToSuperview()
        
        setupCarrousel()
        scrollView.addSubviewForAutolayout(view: carrousel)
        carrousel.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        carrousel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        carrousel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        carrousel.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        carrousel.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.semiboldFont(size: 20)
        scrollView.addSubviewForAutolayout(view: titleLabel)
        titleLabel.topAnchor.constraint(equalTo: carrousel.bottomAnchor, constant: 15).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5).isActive = true
        
        subtitleLabel.text = listing.title
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center
        subtitleLabel.font = UIFont.regularFont(size: 14)
        scrollView.addSubviewForAutolayout(view: subtitleLabel)
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5).isActive = true
        
        priceLabel.text = (listing.price != nil) ? "$\(listing.price!)" : nil
        priceLabel.textAlignment = .center
        priceLabel.font = UIFont.boldFont(size: 22)
        scrollView.addSubviewForAutolayout(view: priceLabel)
        priceLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 5).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -5).isActive = true
        
        descriptionHeaderLabel.text = "DESCRIPTION"
        descriptionHeaderLabel.font = UIFont.regularFont(size: 12)
        descriptionHeaderLabel.alpha = 0.5
        scrollView.addSubviewForAutolayout(view: descriptionHeaderLabel)
        descriptionHeaderLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10).isActive = true
        descriptionHeaderLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30).isActive = true
        
        descriptionLabel.text = listing.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.regularFont(size: 12)
        scrollView.addSubviewForAutolayout(view: descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: descriptionHeaderLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -30).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30).isActive = true
    }
    
    func setupCarrousel() {
        carrousel.isPagingEnabled = true
        
        var previousImageView: UIImageView?
        for imageUrl in listing.imageUrls ?? [] {
            guard let url = URL(string: imageUrl) else { continue }
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.af_setImage(withURL: url)
            carrousel.addSubviewForAutolayout(view: imageView)
            imageView.topAnchor.constraint(equalTo: carrousel.topAnchor).isActive = true
            imageView.bottomAnchor.constraint(equalTo: carrousel.bottomAnchor).isActive = true
            imageView.widthAnchor.constraint(equalTo: carrousel.widthAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: carrousel.heightAnchor).isActive = true
            
            if let previousImageView = previousImageView {
                imageView.leadingAnchor.constraint(equalTo: previousImageView.trailingAnchor).isActive = true
            } else {
                imageView.leadingAnchor.constraint(equalTo: carrousel.leadingAnchor).isActive = true
            }
            
            if imageUrl == listing.imageUrls?.last {
                imageView.trailingAnchor.constraint(equalTo: carrousel.trailingAnchor).isActive = true
            }
            
            previousImageView = imageView
        }
    }
}
