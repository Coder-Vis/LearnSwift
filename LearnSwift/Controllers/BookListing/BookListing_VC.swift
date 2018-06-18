//
//  BookListing_VC.swift
//  LearnSwift
//  Copyright © 2018 visapp. All rights reserved.
//

import UIKit

import Foundation
 
class BookListing_VC: Base_UIViewController {
 let  bookListingServiceManagement =  BookListing_ServiceManagement()
    var arrayBookClass = Books.self //why we use .self
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getBookList()
    }

    
    
    func getBookList(){
        let postLink =  NetworkURL.GoogleApiDomain+NetworkURL.GoogleBookApiPath
        let postString = "q=quilting"
        bookListingServiceManagement.getBookDetails(controller: self, postString: postString , postLink: postLink) { (isSuccess, apiModelResponse , errorMsg) in
            if isSuccess {
                guard let modelObj = apiModelResponse as! Books! else {
                    return
                }
                print("Msg  =\(modelObj.kind)")
                
                //let item = Item.self
                for item in (modelObj.items as? [Item])!
                {
                    
                    print(item.etag)
                }
                
                
            }else{
                print("Response  :  \(errorMsg)")
                
                
            }
        }
    }
    
    
}
