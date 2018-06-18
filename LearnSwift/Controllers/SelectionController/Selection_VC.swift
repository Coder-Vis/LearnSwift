//
//  Selection_VC.swift
//  LearnSwift
//
//  Created by Vishnu on 24/04/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import UIKit

class Selection_VC: Base_UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var arrSelectionModes = ["UserListing","BookListing","SearchListing","Test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   

}
extension Selection_VC{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSelectionModes.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let selectionListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectionlistcell", for: indexPath) as! SelectionList_Cell
        
        return selectionListCell.setViews(text: arrSelectionModes[indexPath.row] , imgStr: "user")
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch arrSelectionModes[indexPath.row] {
            
        case "UserListing" :
            DispatchQueue.main.async(execute: {
                let vc = self.storyboard!.instantiateViewController(withIdentifier:StoryBoardIdentifier.UserListing_VC ) as! UserListing_VC
                self.present(vc, animated: true, completion: nil)
            })
            
        case "BookListing" :
            
            DispatchQueue.main.async(execute: {
                let vc = self.storyboard!.instantiateViewController(withIdentifier:StoryBoardIdentifier.BookListing_VC ) as! BookListing_VC
                self.present(vc, animated: true, completion: nil)
            })
            
        case "SearchListing" :
            
            DispatchQueue.main.async(execute: {
                let vc = self.storyboard!.instantiateViewController(withIdentifier:StoryBoardIdentifier.SearchListing_VC ) as! SearchListing_VC
                self.present(vc, animated: true, completion: nil)
            })
            
           
        default:
            break
        }
    }
}

class SelectionList_Cell : UICollectionViewCell {
    
    @IBOutlet weak var lblText: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    func setViews(text:String,imgStr:String) -> UICollectionViewCell
    {
        lblText.text=text
        img.image = UIImage(named:imgStr)
        return self
    }
    
    
}
