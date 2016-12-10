//
//  Extensions.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexString: String) {
        let hex = hexString.replacingOccurrences(of: "#", with: "")
        let length = hex.characters.count
        
        let scanner = Scanner(string:hex)
        var hexValue: CUnsignedLongLong = 0
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 1
        
        if scanner.scanHexInt64(&hexValue) {
            if length == 6 {
                red = CGFloat(Double((hexValue & 0xFF0000) >> 16) / 255)
                green = CGFloat(Double((hexValue & 0x00FF00) >> 8) / 255)
                blue = CGFloat(Double(hexValue & 0x0000FF) / 255)
            } else if length == 8 {
                red = CGFloat(Double((hexValue & 0xFF000000) >> 24) / 255)
                green = CGFloat(Double((hexValue & 0x00FF0000) >> 16) / 255)
                blue = CGFloat(Double((hexValue & 0x0000FF00) >> 8) / 255)
                alpha = CGFloat(Double(hexValue & 0x000000FF) / 255)
            } else {
                print("invalid hex string")
            }
        } else {
            print("hex scan error")
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIImage {
    
    static let grailedPlaceholderImage = UIImage.imageWithColor(UIColor(hexString: "eeeeee"))
    
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
