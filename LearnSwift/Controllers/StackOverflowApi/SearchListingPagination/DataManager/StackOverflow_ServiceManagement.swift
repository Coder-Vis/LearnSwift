//
//  StackOverflow_ServiceManagement.swift
//  LearnSwift

//  Copyright © 2018 visapp. All rights reserved.
//

import Foundation
import UIKit
public class StackOverflow_ServiceManagement {
    
    func getUser(controller:UIViewController , postLink : String , postString : String , id : Int ,  onCloudResponseRecieved : @escaping onCloudResponseRecieved) {
        
        
        
        ApiFetch.shared.get(postLink: postLink, postString: postString , onSuccess: { (Response) in
            
            do{
                let user = try JSONDecoder().decode(StackSearchModel.self, from: Response)
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
