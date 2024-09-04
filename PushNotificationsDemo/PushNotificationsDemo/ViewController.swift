//
//  ViewController.swift
//  PushNotificationsDemo
//
//  Created by indus on 29/08/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seachLabel: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var roundView: UIView!
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
        
        
               mainView.layer.shadowColor = UIColor.black.cgColor
               mainView.layer.shadowOffset = CGSize(width: 0, height: 4)
               mainView.layer.shadowOpacity = 0.3
               mainView.layer.shadowRadius = 8
        
        roundView.layer.shadowColor = UIColor.black.cgColor
        roundView.layer.shadowOffset = CGSize(width: 0, height: 4)
        roundView.layer.shadowOpacity = 0.3
        roundView.layer.shadowRadius = 8
        
        imgView.image = UIImage(named: "MicrosoftTeams-image (14)")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        let width = roundView.frame.size.width
        roundView.layer.cornerRadius = width / 2
        roundView.layer.masksToBounds = true
    }

    
}

