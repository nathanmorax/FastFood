//
//  DishPortraitCollectionViewCell.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit
import SDWebImage

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DishPortraitCollectionViewCell"

    @IBOutlet weak var titleDishLabel: UILabel!
    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var dish: Dish? {
        didSet {
            titleDishLabel.text = dish?.name
            dishImage.sd_setImage(with: URL(string: dish?.image ?? ""))
            caloriesLabel.text = dish?.formattedCalories
            descriptionLabel.text = dish?.description
        }
    }
}
