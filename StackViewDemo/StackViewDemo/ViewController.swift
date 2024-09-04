//
//  ViewController.swift
//  StackViewDemo
//
//  Created by indus on 30/08/24.
//

import UIKit
import Kingfisher
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var imgCollectionnView: UICollectionView!
    
    @IBOutlet weak var productsTableView: UITableView!
    
//    var products : [Product] = []
    var uiNib : UINib?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionViewCell()
        parseJson()
        initTableView()
    }
    func initTableView(){
        productsTableView.dataSource = self
        productsTableView.delegate = self
    }
    func registerCollectionViewCell(){
        let uiNib = UINib(nibName: "ProductsTableViewCell", bundle: nil)
        self.productsTableView.register(uiNib, forCellReuseIdentifier: "ProductsTableViewCell")
    }
    
    func parseJson() {
        // API endpoint URL
        let urlString = "https://dummyjson.com/products"
        
        // Ensure the URL is valid
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Check for errors
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            // Ensure we received data
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Parse the JSON data using JSONDecoder
            do {
                //let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
               // self.products = decodedResponse.products
                
                // Reload the table view on the main thread
                DispatchQueue.main.async {
                    self.productsTableView.reloadData()
                }
                
                // Example: Loop through and print product titles
//                for product in self.products {
//                  //  print("Product Title: \(product.title)")
//                }
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        // Start the data task
        task.resume()
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // products.count
        return 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = self.productsTableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell",for: indexPath ) as! ProductsTableViewCell
//        product.productTitleLable.text = products[indexPath.row].title
//        product.productImageView.kf.setImage(with: URL(string: products[indexPath.row].images.joined(separator: "\n")))
//        product.productDiscriptionLable.text = products[indexPath.row].description
//        product.productCatogayLable.text = products[indexPath.row].category
//        product.productPriceLable.text =  String(products[indexPath.row].price)
        return product
    }
    
    
}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
}

