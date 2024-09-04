//
//  ViewController.swift
//  IndusAppReplica
//
//  Created by indus on 23/08/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ImagesCollectionView: UICollectionView!
    
    @IBOutlet weak var sectionsCollectionView: UICollectionView!
    
    var sectionImages : [UIImage] = [UIImage(named: "my-account-1")!,UIImage(named: "notification-bell")!,UIImage(named: "card-icon")!,UIImage(named: "dashboard-new-sale")!,UIImage(named: "ipg")!,UIImage(named: "dashboard-center-locater")!,UIImage(named: "dashboard-seminar-traning")!,UIImage(named: "add-training-dashboard")!,UIImage(named: "NewVideos")!]
    
    var sectionNames : [String] = ["My Accounnt"," Notifications","Identification Card","New Sale","IPG & QR Code","Center Location","Seminar Traning","Traning","Videos"]
    var images : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
    }
    func initializeCollectionView(){
        sectionsCollectionView.dataSource = self
        sectionsCollectionView.delegate = self
    }

    @IBAction func sideBarButton(_ sender: Any) {
        
    }
    
}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return sectionImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionCollectionViewCell = self.sectionsCollectionView.dequeueReusableCell(withReuseIdentifier: "SectionsCollectionViewCell", for: indexPath) as! SectionsCollectionViewCell
        
        sectionCollectionViewCell.sectionImageView.image = sectionImages[indexPath.row]
        sectionCollectionViewCell.sectionNameLabel.text = sectionNames[indexPath.row]
        sectionCollectionViewCell.layer.borderColor = UIColor.black.cgColor
        sectionCollectionViewCell.layer.borderWidth = 1
        return sectionCollectionViewCell
    }
    
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2
        return CGSize(width: size, height: size)
    }
}
