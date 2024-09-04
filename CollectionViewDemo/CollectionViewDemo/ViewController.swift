//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by indus on 22/08/24.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {

    var products : [Product] = []
    var uiNnib : UINib?
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        parseJson()
        initializeCollectionView()
    }
    
    func initializeCollectionView(){
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
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
        let productsCollectionsViewCell = self.productsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        productsCollectionsViewCell.proTitleLabel.text = products[indexPath.row].description
        productsCollectionsViewCell.proImageView.kf.setImage(with: URL(string: products[indexPath.row].images.joined(separator: "\n")))
        
        return productsCollectionsViewCell
  
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the fixed width based on your design
        let fixedWidth = collectionView.bounds.width - 20  // Example: adjusting for padding/margin

        // Calculate the dynamic height for the description
        let product = products[indexPath.row]
        let descriptionText = product.description
        
        // Set attributes for the text, like font and size
        let font = UIFont.systemFont(ofSize: 13)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        
        // Calculate the bounding rectangle for the text
        let textHeight = descriptionText.boundingRect(
            with: CGSize(width: fixedWidth, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: attributes,
            context: nil
        ).height
        
        // Add extra height for image and padding
        let imageHeight: CGFloat = 150 // Example: set your image height
        let padding: CGFloat = 20      // Example: padding between elements
        
        // Calculate the total height required
        let totalHeight = textHeight + imageHeight + padding
        
        // Return the size for the cell
        return CGSize(width: fixedWidth, height: totalHeight)
    }
}
