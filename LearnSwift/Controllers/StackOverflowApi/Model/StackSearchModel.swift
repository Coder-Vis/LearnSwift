//
//	StackSearchModel.swift
//
//	Create by Mukesh Yadav on 25/5/2018


import Foundation

struct StackSearchModel: Codable {

	let has_more: Bool?
    let items: [Items]?
    
    private enum CodingKeys : String , CodingKey {
        case has_more
        case items
    }
    
     init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([Items].self, forKey: .items)
        self.has_more = try container.decodeIfPresent(Bool.self, forKey: .has_more)
    }

}


struct Owner: Codable {
    let display_name: String?
    let reputation : Int
    let accept_rate : Int
    let profile_image : String
    
    private enum CodingKeys : String , CodingKey {
        case display_name
        case reputation
        case accept_rate
        case profile_image
    }
    
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.display_name = try container.decodeIfPresent(String.self, forKey: .display_name)
        self.reputation = try container.decodeIfPresent(Int.self, forKey: .reputation) ?? 0
        self.accept_rate = try container.decodeIfPresent(Int.self, forKey: .accept_rate) ?? 0
        self.profile_image = try container.decodeIfPresent(String.self, forKey: .profile_image) ?? ""
    }
}


struct Items: Codable {
    
    let answer_count: Int?
    let owner: Owner?
    let tags: [String]
    let title : String
    let is_answered : Bool
    
    private enum CodingKeys : String , CodingKey {
        case answer_count
        case tags
        case owner
        case title
        case is_answered
    }
    
    init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.answer_count = try container.decodeIfPresent(Int.self, forKey: .answer_count)
        self.tags = try container.decodeIfPresent([String].self, forKey: .tags) ?? [""]
        self.owner = try container.decodeIfPresent(Owner.self, forKey: .owner)
        self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        self.is_answered = try container.decodeIfPresent(Bool.self, forKey: .is_answered) ?? false
    }
    
    
}
