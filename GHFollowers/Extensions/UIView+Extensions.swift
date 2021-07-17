//
//  UIView+Extensions.swift
//  GHFollowers
//
//  Created by Dala  on 7/17/21.
//

import UIKit

extension UIView {
    func addsubviews(_ views: UIView...) {
        for view in views {
            addsubviews(view)
        }
    }
}
