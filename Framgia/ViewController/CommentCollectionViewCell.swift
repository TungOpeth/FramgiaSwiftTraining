//
//  CommentCollectionViewCell.swift
//  Framgia
//
//  Created by  on 1/9/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

class CommentCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var avatarImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var likedLbl: UILabel!
    @IBOutlet weak var repliesLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override class func getSize() -> CGSize {
        return CGSize (width: DeviceManager.getWinSize().width, height: 165)
    }
    
//    
//    override class func getSizeWithItem(withItem item: AnyObject) -> CGSize {
//                if let comment = item as? Comment {
//                    let des = comment.content
//        
//                    let messageHeight = des.height(withConstrainedWidth: DeviceManager.getWinSize().width - 40, font: UIFont.systemFont(ofSize: 15))
//        
//                    let height = 90  +  messageHeight
//                    return CGSize (width: DeviceManager.getWinSize().width, height: height )
//                }
//        return CGSize(width:  DeviceManager.getWinSize().width, height: 300)
//    }
    
    override func configCell(_ item: AnyObject) {
        if let comment = item as? Comment {
            userNameLbl.text = comment.userName
            contentLbl.text = comment.content
            likedLbl.text = comment.liked
            repliesLbl.text = comment.replied
            avatarImg.sd_setImage(with: URL(string:comment.avatarURL), placeholderImage: nil)
        }
    }
}
