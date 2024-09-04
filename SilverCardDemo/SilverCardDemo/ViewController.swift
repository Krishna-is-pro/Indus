//
//  ViewController.swift
//  SilverCardDemo
//
//  Created by indus on 02/09/24.
//

import UIKit

class ViewController: UIViewController{
    
    
    
    @IBOutlet weak var orangeView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var silverCardCollectionView: UICollectionView!
    
    @IBOutlet weak var tapbutton: UIButton!
    

    
    var imgArray = [UIImage(named: "silvercard_frontside"),UIImage(named: "silvercard_backside")]
    
    
    var tag = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        silverCardCollectionView.dataSource = self
        silverCardCollectionView.delegate = self
        
    }
    
    
    @IBAction func tapButton(_ sender: UIButton) {
        
        print("my current Imsge =\(sender.tag)")
      
        tag = (tag == 0) ? 1 : 0
        
        
                if tag == 0{
                    sender.setImage(UIImage(named: "left-caret"), for: .normal)

                }
                else if tag == 1 {
                    sender.setImage(UIImage(named: "right-caret"), for: .normal)

                }
            
        
        print("Current tag: \(tag)")
        
        let indexPath = IndexPath(item: tag, section: 0)
        silverCardCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
        
}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0{
            let collectionviewCells = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        collectionviewCells.silverCardImageView.image = UIImage(named: "silvercard_frontside")
           
            
            return collectionviewCells
        }
        
        let collectionviewCell2e = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
       // collectionviewCell2e.imgView.image = imgArray[1]
        collectionviewCell2e.imgView.image = UIImage(named: "silvercard_backside")
        return collectionviewCell2e
        
    }
}
extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 340, height: 215)
    }
    
}

