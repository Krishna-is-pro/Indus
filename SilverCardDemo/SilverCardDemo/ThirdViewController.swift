//
//  ThirdViewController.swift
//  SilverCardDemo
//
//  Created by indus on 03/09/24.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var myview: UIView!
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = "Ta-Da! You've Discovered the Secret Room! 🎉"
    }
    
    @IBAction func gobckBtn(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        

    }
    
    

}
