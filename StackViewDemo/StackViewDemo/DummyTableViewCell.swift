//
//  DummyTableViewCell.swift
//  StackViewDemo
//
//  Created by indus on 31/08/24.
//

import UIKit

class DummyTableViewCell: UITableViewCell {

    @IBOutlet weak var backgroundView2: UIView!
    
    @IBOutlet weak var stack1: UIStackView!
    
    @IBOutlet weak var thumbNailImgView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var innerrStackView: UIStackView!
    
    @IBOutlet weak var imgDummyView: UIImageView!
    
    @IBOutlet weak var priceLabel2: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var stack2: UIStackView!
    
    @IBOutlet weak var stack3: UIStackView!
    
    @IBOutlet weak var tag1: UILabel!
    
    
    
    @IBOutlet weak var tag2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
