//
//  SecondViewController.swift
//  SilverCardDemo
//
//  Created by indus on 03/09/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    @IBOutlet weak var pressButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = "Hello,Ready for Some Magic? 🪄"
    }

    @IBAction func btnAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
           if let tvc = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController {
               tvc.modalPresentationStyle = .pageSheet
               present(tvc, animated: true, completion: nil)
           }
    }
    
    
}
