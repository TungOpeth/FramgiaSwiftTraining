//
//  FeedCollectionViewCell.swift
//  Framgia
//
//  Created by  on 12/27/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit
import SDWebImage


class FeedCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var liked: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override class func getSize() -> CGSize {
        return CGSize (width: DeviceManager.getWinSize().width, height: 165)
    }
    
    
    override class func getSizeWithItem(withItem item: AnyObject) -> CGSize {
//        if let feed = item as? NewsFeed {
//            let des = feed.content
//            
//            let messageHeight = des.height(withConstrainedWidth: DeviceManager.getWinSize().width - 40, font: UIFont.systemFont(ofSize: 17))
//            
//            let height = 144  +  messageHeight
//            return CGSize (width: DeviceManager.getWinSize().width, height: height )
//        }
        return CGSize(width:  DeviceManager.getWinSize().width, height: 300)
    }
    
    override func configCell(_ item: AnyObject) {
        if let feed = item as? NewsFeed {
            userName.text = feed.userName
            content.text = feed.content
            liked.text = feed.liked
            comments.text = feed.commented
            
            
            let readmoreFont = UIFont(name: "Helvetica", size: 15.0)
            let readmoreFontColor = UIColor.blue
            DispatchQueue.main.async {
                self.content.addTrailing(with: "... ", moreText: "Read more", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
            }
            
            imageView.sd_setImage(with: URL(string:feed.avatarURL), placeholderImage: nil)

        }
    }
}
