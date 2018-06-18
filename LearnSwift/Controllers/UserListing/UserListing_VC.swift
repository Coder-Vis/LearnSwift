//
//  UserListing_VC.swift
//  LearnSwift
//
//  Created by Vishnu on 19/04/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import UIKit

class UserListing_VC: Base_UIViewController , UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayUserClass = [UserClass]()
    let userListingServiceManagement = UserListing_ServiceManagement()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getResource()
    }

    func getResource(){
       
        let postLink =  NetworkURL.JsonApiDomain+NetworkURL.JsonUserApiPath
        userListingServiceManagement.getUser(controller: self, postLink: postLink, postString: "", id: 0) { (isSuccess, apiResponseModel , errorMsg) in
            if isSuccess
            {
                guard let apiModelObj = apiResponseModel as? [UserClass] else
                {
                    DispatchQueue.main.async {
                        //self.alert(message: "Unable to get content")
                    }
                    
                    return
                }
                self.arrayUserClass = apiModelObj
              
                for item in apiModelObj
                {
                    
                    print(item.company.bs)
                }
               
                DispatchQueue.main.async {
                self.collectionView.reloadData()
                }
                
            }else{
                print("Response  :  \(errorMsg)")
               
                
            }
            
            
        }
        
        
        
    }
    

   

}

extension UserListing_VC {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayUserClass.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usercell", for: indexPath) as! UserCell
        return cell.setView(name: arrayUserClass[indexPath.row].name, companyName: arrayUserClass[indexPath.row].company.name, geoLat: arrayUserClass[indexPath.row].websitee)
    }
}
//usercell
class UserCell : UICollectionViewCell{
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var companNameyLbl: UILabel!
    @IBOutlet weak var geoLatLbl: UILabel!
    
    func setView(name : String ,companyName: String , geoLat: String) -> UICollectionViewCell{
        nameLbl.text = name
        companNameyLbl.text = companyName
        geoLatLbl.text = geoLat
        return self
    }
    
}
