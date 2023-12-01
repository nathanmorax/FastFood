//
//  CategoryCollectionViewCell.swift
//  FastFood
//
//  Created by Xcaret Mora on 30/11/23.
//

import UIKit
import SDWebImage

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let indetifier = String(describing: CategoryCollectionViewCell.self)

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var category: DishCategory? {
        didSet {
            categoryTitleLabel.text = category?.name
            categoryImage.sd_setImage(with: URL(string: category?.image ?? "" ))
        }
    }

}
