//
//  FeedCollectionViewCell.swift
//  Framgia
//
//  Created by  on 12/27/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

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
        if let feed = item as? NewsFeed {
            let des = feed.content
            
            let messageHeight = des.height(withConstrainedWidth: DeviceManager.getWinSize().width - 40, font: UIFont.systemFont(ofSize: 17))
            
            let height = 144  +  messageHeight
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
            imageView.downloadedFrom(link: feed.imageURL)


        }
    }
}

extension String{
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
