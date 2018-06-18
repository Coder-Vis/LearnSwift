//
//  UserListing_ServiceManagement.swift
//  LearnSwift
//
//  Created by Vishnu on 19/04/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import Foundation
import UIKit



class UserListing_ServiceManagement : NSObject{
     
   
    /*
     if ApiFetch doesnot import SystemConfiguration then we should use ApiFetch().get(
     */
    
    func getUser(controller:UIViewController , postLink : String , postString : String , id : Int ,  onCloudResponseRecieved : @escaping onCloudResponseRecieved) {
        
        
        
        ApiFetch.shared.get(postLink: postLink, postString: postString , onSuccess: { (Response) in
            
            do{
                let user = try JSONDecoder().decode([UserClass].self, from: Response)
                onCloudResponseRecieved(true, user , "")
            }catch{
                onCloudResponseRecieved(false, nil, "Exception While decoding " )
            }
            
            
        }) { (Error) in
            print(Error)
            onCloudResponseRecieved(false, nil, Error)
             
        }
        
    }
}
