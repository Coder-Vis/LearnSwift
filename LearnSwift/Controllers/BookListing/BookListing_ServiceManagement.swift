//
//  BookListing_ServiceManagement.swift
//  LearnSwift

//  Copyright © 2018 visapp. All rights reserved.
//

import Foundation
import UIKit

class BookListing_ServiceManagement : NSObject {
    
    func getBookDetails(controller : UIViewController , postString:String , postLink : String , onCloudResponse :  @escaping onCloudResponseRecieved){
        
        ApiFetch.shared.get(postLink: postLink, postString: postString, onSuccess: { (ResponseData) in
             do {
                let books = try JSONDecoder().decode(Books.self, from: ResponseData)
                 
                onCloudResponse(true, books, "isSuccess")
            }catch{
                onCloudResponse(false, nil, "Exception While decoding ")
            }
            
         }) { (ErrorResult) in
            onCloudResponse(false, nil, ErrorResult )
        }
    }
}
