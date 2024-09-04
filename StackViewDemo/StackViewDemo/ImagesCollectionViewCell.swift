//
//  ImagesCollectionViewCell.swift
//  StackViewDemo
//
//  Created by indus on 30/08/24.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
           super.awakeFromNib()
           img.contentMode = .scaleAspectFit // This will make sure the image fits the cell without clipping
       }
    
}
