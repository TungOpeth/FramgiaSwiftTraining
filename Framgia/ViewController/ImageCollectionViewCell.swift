//
//  ImageCollectionViewCell.swift
//  Framgia
//
//  Created by  on 1/5/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: BaseCollectionViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var liked: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var previewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override class func getSize() -> CGSize {
        return CGSize (width: DeviceManager.getWinSize().width, height: 378)
    }
    
    
    override class func getSizeWithItem(withItem item: AnyObject) -> CGSize {
        if let feed = item as? NewsFeed {
            let des = feed.content
            
            let messageHeight = des.height(withConstrainedWidth: DeviceManager.getWinSize().width - 40, font: UIFont.systemFont(ofSize: 17))
            
            let height = 353  +  messageHeight
            return CGSize (width: DeviceManager.getWinSize().width, height: height )
        }
        return CGSize(width:  DeviceManager.getWinSize().width, height: 300)
    }
    
    override func configCell(_ item: AnyObject) {
        if let feed = item as? NewsFeed {
            userName.text = feed.userName
            content.text = feed.content
            liked.text = feed.liked
            comments.text = feed.commented
            imageView.sd_setImage(with: URL(string:feed.avatarURL), placeholderImage: nil)
            if let imgfirst = feed.getImageAtIndex(0) {
                previewImage.sd_setImage(with: URL(string:imgfirst), placeholderImage: nil)
            }
        }
    }
}
