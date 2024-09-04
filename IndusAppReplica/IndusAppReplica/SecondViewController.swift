//
//  SecondViewController.swift
//  IndusAppReplica
//
//  Created by indus on 23/08/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    
    @IBOutlet weak var ImagesCollectionView: UICollectionView!
    
    @IBOutlet weak var MenuView: UIView!
    
    
    
    
    
    var sectionImages : [UIImage] = [UIImage(named: "my-account-1")!,UIImage(named: "notification-bell")!,UIImage(named: "card-icon")!,UIImage(named: "dashboard-new-sale")!,UIImage(named: "ipg")!,UIImage(named: "dashboard-center-locater")!,UIImage(named: "dashboard-seminar-traning")!,UIImage(named: "add-training-dashboard")!,UIImage(named: "NewVideos")!]
    
    var sectionNames : [String] = ["My Accounnt"," Notifications","Identificationj Card","New Sale","IPG & QR Code","Center Location","Seminar Traning","Traning","Videos"]
    var img : [UIImage] = [UIImage(named: "my-account-1")!,UIImage(named: "notification-bell")!,UIImage(named: "card-icon")!,UIImage(named: "dashboard-new-sale")!,UIImage(named: "ipg")!,UIImage(named: "dashboard-center-locater")!,UIImage(named: "dashboard-seminar-traning")!,UIImage(named: "add-training-dashboard")!,UIImage(named: "NewVideos")!]

    var autoScrollTimer: Timer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        startAutoScrollTimer()


    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        autoScrollTimer?.invalidate()
    }
    func startAutoScrollTimer() {
        autoScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScrollImages), userInfo: nil, repeats: true)
    }

    @objc func autoScrollImages() {
        let visibleItems = ImagesCollectionView.indexPathsForVisibleItems
        if visibleItems.isEmpty { return }

        let nextItem = (visibleItems[0].item + 1) % sectionImages.count
        let nextIndexPath = IndexPath(item: nextItem, section: 0)
        
        ImagesCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
   
    func initializeCollectionView(){
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        ImagesCollectionView.dataSource = self
        ImagesCollectionView.delegate = self
    }


}

extension SecondViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionImages.count
}
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == myCollectionView{
        let mycollectionviewcell =
        self.myCollectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        
        mycollectionviewcell.scetionImageView.image = sectionImages[indexPath.row]
        mycollectionviewcell.sectionNameLabel.text = sectionNames[indexPath.row]
        mycollectionviewcell.contentView.layer.borderColor = UIColor.black.cgColor
        mycollectionviewcell.contentView.layer.borderWidth = 1
        return mycollectionviewcell
    }else if collectionView == ImagesCollectionView {
        let imageCell = ImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        imageCell.imageView.image = sectionImages[indexPath.row]
        return imageCell
    }
    return UICollectionViewCell()
}
    
    
}
extension SecondViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = (collectionView.layer.frame.size.width-5)/2
        return CGSize(width: size, height: 130)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 5
       }
}
