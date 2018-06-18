//
//  Books.swift
//  LearnSwift

//  Copyright © 2018 visapp. All rights reserved.
//

import Foundation

class Books: Codable {
    
    var items: [Item]?
    var kind: String
    var totalItems: Int
    private enum CodingKeys : String , CodingKey {
        case items
        case kind
        case totalItems
        
    }
    
    required init(from decoder: Decoder) throws
    {
        /*  decodeIfPresent - try to decode only if daata is present
         self.company = try container.decode(Company.self, forKey: .company)
         self.company = try container.decodeIfPresent(Company.self, forKey: .company)
         */
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent([Item].self, forKey: .items)
        self.kind = (try container.decodeIfPresent(String.self, forKey: .kind))!
        self.totalItems = (try container.decodeIfPresent(Int.self, forKey: .totalItems))!
    }
    
    
}


class Item: Codable {
    var accessInfo: AccessInfo?
    var etag: String?
    var id: String?
    var kind: String?
    var saleInfo: SaleInfo?
    var searchInfo: SearchInfo?
    var selfLink: String?
    var volumeInfo: VolumeInfo?
    private enum CodingKeys : String , CodingKey {
        case accessInfo
        case etag
        case id
        case kind
        case saleInfo
        case searchInfo
        case selfLink
        case volumeInfo
        
    }
    required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accessInfo = try container.decodeIfPresent(AccessInfo.self, forKey: .accessInfo)
        self.etag = try container.decodeIfPresent(String.self, forKey: .etag)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.kind  =  try container.decodeIfPresent(String.self, forKey: .kind)
        self.saleInfo = try container.decodeIfPresent(SaleInfo.self, forKey: .saleInfo)
        self.searchInfo = try container.decodeIfPresent(SearchInfo.self, forKey: .searchInfo)
        self.selfLink = try container.decodeIfPresent(String.self, forKey: .selfLink) ?? "#"
        self.volumeInfo = try container.decodeIfPresent(VolumeInfo.self, forKey: .volumeInfo)
        
    }
    
}
class AccessInfo: Codable {
    
    var accessViewStatus: String?
    var country: String?
    var embeddable: Bool?
    var epub: Epub?
    var pdf: Epub?
    var publicDomain: Bool?
    var quoteSharingAllowed: Bool?
    var textToSpeechPermission: String?
    var viewability: String?
    var webReaderLink: String?
    
}
class Epub: Codable {
    
    var isAvailable: Bool?
    
}

class SaleInfo: Codable {
    
    var country: String?
    var isEbook: Bool?
    var saleability: String?
    
}

class SearchInfo: Codable {
    var textSnippet: String?
    
}
class VolumeInfo: Codable {
    var allowAnonLogging: Bool?
    var authors: [String]?
    var canonicalVolumeLink: String?
    var categories: [String]?
    var contentVersion: String?
    var descriptionField: String?
    var imageLinks: ImageLink?
    var industryIdentifiers: [IndustryIdentifier]?
    var infoLink: String?
    var language: String?
    var maturityRating: String?
    var pageCount: Int?
    var previewLink: String?
    var printType: String?
    var publishedDate: String?
    var publisher: String?
    var readingModes: ReadingMode?
    var title: String?
    
}

class IndustryIdentifier: Codable {
    var identifier: String?
    var type: String?
    
}
class ImageLink: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
    
}

class ReadingMode: Codable {
    var image: Bool?
    var text: Bool?
}

