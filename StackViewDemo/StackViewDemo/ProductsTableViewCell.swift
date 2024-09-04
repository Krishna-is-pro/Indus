//
//  ProductsTableViewCell.swift
//  StackViewDemo
//
//  Created by indus on 30/08/24.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var stackOne: UIStackView!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var productTitleLable: UILabel!
    
    @IBOutlet weak var middleView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var innerStackView: UIStackView!
    
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var productDiscriptionLable: UILabel!
 
    @IBOutlet weak var productCatogayLable: UILabel!
    
    @IBOutlet weak var productPriceLable: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

   
    
}
