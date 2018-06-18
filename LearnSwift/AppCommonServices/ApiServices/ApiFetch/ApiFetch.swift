//
//  ApiFetch.swift
//  LearnSwift
//
//  Created by Vishnu on 17/04/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import Foundation
//import SystemConfiguration

public typealias onApiJsonRecieved = ( _ isResponseAvail :  @escaping(Any) -> Void , _ onFailure :  @escaping(Error) -> Void ) -> ()


//public final
class ApiFetch {
    
    private init(){}  // private constructor
    static let shared = ApiFetch()  //shared instance
    
    
     func get(postLink : String , postString : String , onSuccess: @escaping(Data) -> Void, onFailure: @escaping(Any) -> Void) {
        
        var link = ""
        
        if postString.trimmingCharacters(in: .whitespaces) == "" {
            link = postLink
        }else {
            link = postLink+postString
        }
        
        guard let url = URL(string : link ) else {
            print("URL ERROR")
            onFailure("URL ERROR" )
            return
        }
       
        print("URL : \(link)   \n")
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data,  headerResponse, error) in
            print("ENTERED ApiFetch SESSION TASK")
            if let headerResponse = headerResponse {
                print(headerResponse)
            }
           
            
            if let data = data {
                 let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                print(responseString ?? "Default response string")
                onSuccess(data)
            }else{
                print("API FETCH ERRROR  =\(String(describing: error))")
                onFailure(error!)
            }
            
            }.resume()
        
        
        
    }
}

