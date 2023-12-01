//
//  UIView+Extension.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
