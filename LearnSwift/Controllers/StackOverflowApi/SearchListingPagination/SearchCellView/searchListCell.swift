//
//  searchListCell.swift
//  LearnSwift
//
//  Created by Team Baasha on 26/05/18.
//  Copyright © 2018 visapp. All rights reserved.
//

import UIKit
//searchListCell  searchlistCell
class searchListCell: UICollectionViewCell {
    
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    @IBOutlet weak var isAnsweredImg: UIImageView!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var displayNameLbl: UILabel!
    @IBOutlet weak var reputationLbl: UILabel!
    @IBOutlet weak var acceptRateLbl: UILabel!
    
    func configure(title:String , tag:[String] , isAnsweres:Bool , displayName:String , reputation:Int , acceptRate : Int , profileImgLink:String ){
        titleLbl.text = title
        displayNameLbl.text = displayName
        reputationLbl.text = String(reputation)
        acceptRateLbl.text = String(acceptRate)
        
    }
    
    
}
