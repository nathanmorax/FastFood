//
//  OnboardingCollectionViewCell.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    @IBOutlet weak var imageCollectionView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var slide: OnboardingSlide? {
        didSet {
            imageCollectionView.image =  slide?.image
            titleLabel.text = slide?.title
            descriptionLabel.text = slide?.description
        }
    }
    
    /*func setup(_ slide: OnboardingSlide) {
        imageCollectionView.image =  slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }*/
    
}
