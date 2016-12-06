//
//  Extensions.swift
//  mchg-ios
//
//  Created by Gianni Settino on 2016-12-06.
//  Copyright © 2016 Milton and Parc. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviewForAutolayout(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
    }
    
    func pinToSuperview() {
        guard let superview = superview else { return }
        topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}
