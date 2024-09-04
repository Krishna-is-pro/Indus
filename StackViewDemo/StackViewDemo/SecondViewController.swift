//
//  SecondViewController.swift
//  StackViewDemo
//
//  Created by indus on 31/08/24.
//

import UIKit
import Kingfisher
import Alamofire

class SecondViewController: UIViewController {

    @IBOutlet weak var dummy: UITableView!
    var uiNnib : UINib?
    var items : [products] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        registerCollectionViewCell()
        parseJsonUsingAlamofire()
    }
    func initTableView(){
        dummy.dataSource = self
        dummy.delegate = self
    }
    func registerCollectionViewCell(){
        let uiNib = UINib(nibName: "DummyTableViewCell", bundle: nil)
        self.dummy.register(uiNib, forCellReuseIdentifier: "DummyTableViewCell")
    }

    func parseJsonUsingAlamofire() {
        let urlString = "https://fakestoreapi.com/products"

        AF.request(urlString).validate().responseDecodable(of: ApiResponnses.self) { response in
            switch response.result {
            case .success(let decodedResponse):
                self.items = decodedResponse.products
                
                DispatchQueue.main.async {
                    self.dummy.reloadData()
                }
                
                for item in self.items {
                    print("Item Title: \(item.title)")
                }
                
            case .failure(let error):
                print("Error fetching data: \(error.localizedDescription)")
            }
        }
    }
}

extension SecondViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dummyproduct = self.dummy.dequeueReusableCell(withIdentifier: "DummyTableViewCell",for: indexPath ) as! DummyTableViewCell
        
        dummyproduct.thumbNailImgView.kf.setImage(with: URL(string: items[indexPath.row].thumbnail ))
        dummyproduct.titleLabel.text = items[indexPath.row].title
        //dummyproduct.priceLabel2.text = String(items[indexPath.row].price)
        dummyproduct.descriptionLabel.text = items[indexPath.row].description
        dummyproduct.categoryLabel.text = items[indexPath.row].category
       // dummyproduct.brandLabel.text = items[indexPath.row].brand
        dummyproduct.tag1.text = items[indexPath.row].tags.joined(separator: "/n")
        dummyproduct.imgDummyView.kf.setImage(with: URL(string: items[indexPath.row].images.joined(separator: "/n") ))
           return dummyproduct
    }
    
    
}
extension SecondViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
}



   


