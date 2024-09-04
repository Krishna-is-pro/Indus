//
//  ViewController.swift
//  ProtocolDelegateDemo
//
//  Created by indus on 02/09/24.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    var products : [ApiResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParse()
        initTableView()
        registerCollectionViewCell()
    }
    func initTableView(){
        productTableView.dataSource = self
        productTableView.delegate = self
    }
    func registerCollectionViewCell(){
        let uiNib = UINib(nibName: "ProductsTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductsTableViewCell")
    }
    func jsonParse(){
        let urlString = "https://fakestoreapi.com/products"
        
        AF.request(urlString).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let products = try JSONDecoder().decode([ApiResponse].self, from: data)
                    self.products = products
                    print(products)
                    DispatchQueue.main.async {
                        self.productTableView.reloadData()
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
                
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
        
    }
    
}
    extension ViewController : UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return products.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let productsTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
            productsTableViewCell.productTitleLabel.text = products[indexPath.row].title
            productsTableViewCell.productIdLabel.text = String(products[indexPath.row].id)
            productsTableViewCell.productDescriptionLabel.text = products[indexPath.row].description
            productsTableViewCell.productPriceLabel.text = String(products[indexPath.row].price)
            productsTableViewCell.productImageView.kf.setImage(with: URL(string: products[indexPath.row].image ?? " "))

            return productsTableViewCell
        }
    }
    extension ViewController : UITableViewDelegate{
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 500
        }
    }

