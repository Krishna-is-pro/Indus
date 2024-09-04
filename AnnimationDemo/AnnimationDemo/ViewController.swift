//
//  ViewController.swift
//  AnnimationDemo
//
//  Created by indus on 30/08/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var annimatedView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        annimatedView.backgroundColor = .red
               annimatedView.frame = CGRect(x: 50, y: 100, width: 100, height: 100)

    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            // Start animation
            animateView()
        }
        
        func animateView() {
            UIView.animate(withDuration: 2.0, delay: 0, options: [.curveEaseInOut, .repeat, .autoreverse], animations: {
                // Move the view
                self.annimatedView.frame.origin.x = self.view.frame.width - self.annimatedView.frame.width - 50
                
                // Change color
                self.annimatedView.backgroundColor = .blue
                
                // Scale the view
                self.annimatedView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            }, completion: nil)
        }

}

