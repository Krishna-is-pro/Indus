//
//  ThirdViewController.swift
//  PushNotificationsDemo
//
//  Created by indus on 29/08/24.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var backgrounndView: UIView!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var segControll: UISegmentedControl!
    
    @IBOutlet weak var stkView: UIStackView!
    
    @IBOutlet weak var smallView: UIView!
    
    
    @IBOutlet weak var imgViewOfSmallView: UIImageView!
    
    @IBOutlet weak var leftView: UIView!
    
    
    @IBOutlet weak var leftImgView: UIImageView!
    
    @IBOutlet weak var rightView: UIView!
    
    
    @IBOutlet weak var rightImgView: UIImageView!
    
    
    @IBOutlet weak var leftLabel: UILabel!
    
    
    @IBOutlet weak var rightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgViewOfSmallView.image = UIImage(named: "add-guest-dashboard")
        leftImgView.image = UIImage(named: "add-guest")
        rightImgView.image = UIImage(named: "guest-from-contact")

    }
    

   

}
