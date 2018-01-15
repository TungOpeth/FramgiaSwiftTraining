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
    
    @IBOutlet weak var readMoreBtn: UIButton!
    
    private var newsfeed = NewsFeed(json: ["":""])
    
    @IBAction func readMoreBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ReadMoreViewController") as! ReadMoreViewController
        
        nextViewController.feed = newsfeed
        
        MainViewController.shared.getRootnavigationController().pushViewController(nextViewController, animated: true)
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override class func getSize() -> CGSize {
        return CGSize (width: DeviceManager.getWinSize().width, height: 400)
    }
    
    
    override class func getSizeWithItem(withItem item: AnyObject) -> CGSize {
        if let feed = item as? NewsFeed {
            if feed.showFull
            {
                let des = feed.content
                
                
                let messageHeight = des.height(withConstrainedWidth: DeviceManager.getWinSize().width - 40, font: UIFont.systemFont(ofSize: 17))
                
                let height = 400  +  messageHeight
                return CGSize (width: DeviceManager.getWinSize().width, height: height )
            } else {
                return CGSize(width:  DeviceManager.getWinSize().width, height: 450)
            }
        }
        return CGSize(width:  DeviceManager.getWinSize().width, height: 400)

    }
    
    override func configCell(_ item: AnyObject?) {
        if let feed = item as? NewsFeed {
            
            newsfeed = feed
            
            userName.text = feed.userName
            content.text = feed.content
            liked.text = feed.liked
            comments.text = feed.commented
            
            
            if !feed.showFull {
                
                readMoreBtn.isHidden = false
                
                let readmoreFont = UIFont(name: "Helvetica", size: 15.0)
                let readmoreFontColor = UIColor.blue
                DispatchQueue.main.async {
                    self.content.addTrailing(with: "... ", moreText: "Read more", moreTextFont: readmoreFont!, moreTextColor: readmoreFontColor)
                }
            } else {
                readMoreBtn.isHidden = true
            }
            
            imageView.sd_setImage(with: URL(string:feed.avatarURL), placeholderImage: nil)
            if let imgfirst = feed.getImageAtIndex(0) {
                previewImage.sd_setImage(with: URL(string:imgfirst), placeholderImage: nil)
            }
        }
    }
}
