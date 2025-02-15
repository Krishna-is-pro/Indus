//  ViewController.swift
//  AlamofireDemo
//  Created by indus on 20/08/24.


import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    var products : [Product] = []
     var uiNib : UINib?
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
        initializeCollectionView()
        registerCollectionViewCell()
    }
      
    func initializeCollectionView(){
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
    }
    func registerCollectionViewCell(){
        let uiNib = UINib(nibName: "cell", bundle: nil)
        productsCollectionView.register(uiNib, forCellWithReuseIdentifier: "cell")
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
                let decodedResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
                self.products = decodedResponse.products
                
                // Reload the table view on the main thread
                DispatchQueue.main.async {
                    self.productsCollectionView.reloadData()
                }
                
                // Example: Loop through and print product titles
                for product in self.products {
                    print("Product Title: \(product.title)")
                }
                
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        // Start the data task
        task.resume()
    }
    
 
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productsCollectionsViewCell = self.productsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductsCollectionViewCell
        
        productsCollectionsViewCell.proTitleLabel.text = products[indexPath.row].title
        productsCollectionsViewCell.proImageView.kf.setImage(with: URL(string: products[indexPath.row].images.joined(separator: "\n")))
        
        return productsCollectionsViewCell
        
    }
}
    extension ViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let width = (collectionView.bounds.width - 30) / 2 // Adjust width for spacing
            let height: CGFloat = 200 // Fixed height for products
            return CGSize(width: width, height: height)
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) // Example insets
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10 // Example spacing
        }
    }

