//
//  CardView.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit

class CardView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 12
        layer.shadowOpacity = 0.1
        cornerRadius = 12
    }
 
}
