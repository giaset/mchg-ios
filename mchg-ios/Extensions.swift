//
//  Extensions.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

extension UIImage {
    
    static let grailedPlaceholderImage = UIImage.imageWithColor(UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1))
    
    class func imageWithColor(_ color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIView {
    
    func addSubviewForAutolayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
 
    func pinToSuperview(insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor, constant: insets.top).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: insets.left).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -insets.right).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}
