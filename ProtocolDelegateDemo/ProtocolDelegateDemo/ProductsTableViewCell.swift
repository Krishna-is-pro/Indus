//
//  ProductsTableViewCell.swift
//  ProtocolDelegateDemo
//
//  Created by indus on 02/09/24.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var sideView: UIView!
    
    @IBOutlet weak var productTitleLabel: UILabel!
    
    
    @IBOutlet weak var productIdLabel: UILabel!
    
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    @IBOutlet weak var productPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
