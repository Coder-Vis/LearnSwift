//
//  SearchListing_VC.swift
//  LearnSwift
//
//  Created by Team Baasha on 25/05/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import UIKit

class SearchListing_VC: BaseStackOverFlowApi_VC , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var collectionView: UICollectionView!
    var count = 1
    var searchModel = StackSearchModel.self {
        didSet{collectionView.reloadData()}
    }
    
    
    var arrItmSearch = [Items]() {
        didSet{
            DispatchQueue.main.async {self.collectionView.reloadData()}
         }
    }
    let  stackOverflowServiceManagement = StackOverflow_ServiceManagement()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColllectionView()
        
        getResource(pageNo:count)
        
    }
    
    func setupColllectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func getResource(pageNo:Int){
        let postString = "page=\(pageNo)&order=desc&sort=activity&tagged=swift&site=stackoverflow"
        let postLink =  NetworkURL.StackApiDomain+NetworkURL.StackApiPath
        stackOverflowServiceManagement.getUser(controller: self, postLink: postLink, postString: postString, id: 0) { (isSuccess, apiResponseModel , errorMsg) in
            if isSuccess
            {
                guard let apiModelObj = apiResponseModel as! StackSearchModel! else
                {
                    DispatchQueue.main.async {
                        //self.alert(message: "Unable to get content")
                    }
                    return
                }
                
                self.arrItmSearch =  self.arrItmSearch + apiModelObj.items!
                print("435543 pageNo =\(pageNo) arrItmSearch.count=\(self.arrItmSearch.count) self.arrItmSearch = \(self.arrItmSearch)")
                for searchApiItem in self.arrItmSearch
                {
                    print(searchApiItem.answer_count)
                }
                
                
            }else{
                print("Response  :  \(errorMsg)")
            }
        }
    }
    
}

extension SearchListing_VC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return arrItmSearch.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == arrItmSearch.count - 1 {
            count = count+1
            getResource(pageNo: count)
           
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.searchListCell , for: indexPath) as? searchListCell else{ return UICollectionViewCell() }
       
        guard let owner = self.arrItmSearch[indexPath.row].owner else {return cell}
        
        cell.configure(title: self.arrItmSearch[indexPath.row].title , tag: self.arrItmSearch[indexPath.row].tags , isAnsweres: self.arrItmSearch[indexPath.row].is_answered , displayName: owner.display_name! , reputation: owner.reputation, acceptRate: owner.accept_rate, profileImgLink: owner.profile_image)
        
        return cell
    }
}
