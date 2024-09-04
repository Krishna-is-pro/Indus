//
//  ProductTableViewCell.swift
//  AlamofireDemo
//
//  Created by indus on 21/08/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    @IBOutlet weak var producytRatingButton: UIButton!
    
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
