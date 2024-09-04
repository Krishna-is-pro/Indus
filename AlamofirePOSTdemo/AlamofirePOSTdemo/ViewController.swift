//
//  ViewController.swift
//  AlamofirePOSTdemo
//
//  Created by indus on 26/08/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    
    @IBOutlet weak var myView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func Postutton(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else {
            print("Title and Body cannot be empty")
            return
        }
        let parameters: [String: Any] = [
            "titlE": title,
            "body": body,
            "userId": "101"
        ]
        // API URL
        let url = "https://jsonplaceholder.typicode.com/posts"
        // Alamofire POST request
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let data):
                print("Success! Response: \(data)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
}

    
   
    

