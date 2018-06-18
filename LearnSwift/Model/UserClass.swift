//
//  UserClass.swift
//  LearnSwift
//
//  Created by Vishnu on 20/04/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import Foundation

 class UserClass: Codable {
    
    
    let company: Company!
    let email: String!
    let id: Int!
    let name: String!
    let phone: String!
    let username: String!
    let websitee: String!
    
    private enum CodingKeys : String , CodingKey {
        case company
        case email
        case id
        case name
        case phone
        case username
        case websitee
        
    }
    
    required init(from decoder: Decoder) throws
    {
        /*  decodeIfPresent - try to decode only if daata is present
         self.company = try container.decode(Company.self, forKey: .company)
         self.company = try container.decodeIfPresent(Company.self, forKey: .company)
         */
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.company = try container.decodeIfPresent(Company.self, forKey: .company)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name  =  try container.decodeIfPresent(String.self, forKey: .name)  ?? "#"
        self.phone = try container.decodeIfPresent(String.self, forKey: .phone)
        self.username = try container.decodeIfPresent(String.self, forKey: .username)
        self.websitee = try container.decodeIfPresent(String.self, forKey: .websitee) ?? "#"
        
        
    }
}


 class Company: Codable {
    
    var bs: String!
    var catchPhrase: String!
    var name: String!
    
    
}
