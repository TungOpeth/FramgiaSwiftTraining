//
//  TimeLineController.swift
//  Framgia
//
//  Created by Pham Tien on 1/12/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

class TimeLineController: BaseCollectionController {
    convenience init(initWithTargetCollection _targetCollection:UICollectionView) {
        self.init()
        self.initWithTargetCollectionView(_targetCollection)
        self.updateWithListItem([])
        self.getData()
    }
    
    override func refreshHeaderDidChange() {
        self.updateWithListItem([])
        getData()
    }
    
    func getData() {
        NewsFeed.downloadNewsFeeds(completed: { (items) in
            self.updateWithListItem(items)
        })
    }
    
    override func registerNibWithColletion(_ collectionView: UICollectionView) {
        collectionView.register(ProfileCollectionViewCell.getNib(), forCellWithReuseIdentifier: ProfileCollectionViewCell.getIdentify())
        
        collectionView.register(FeedCollectionViewCell.getNib(), forCellWithReuseIdentifier: FeedCollectionViewCell.getIdentify())
        
        collectionView.register(StatusCollectionViewCell.getNib(), forCellWithReuseIdentifier: StatusCollectionViewCell.getIdentify())
        
        collectionView.register(ImagesCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImagesCollectionViewCell.getIdentify())
        
        collectionView.register(ImageCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImageCollectionViewCell.getIdentify())
    }
    
    override func getCellIndenifi(_ item: AnyObject?, returnNameClass: Bool) -> String {
        if let _item = item as? NewsFeed {
            if returnNameClass {
                if _item.getType() == "1" {
                    return NSStringFromClass(ImagesCollectionViewCell.self)
                } else if _item.getType() == "2" {
                    return NSStringFromClass(ImageCollectionViewCell.self)
                } else {
                    return NSStringFromClass(FeedCollectionViewCell.self)
                }
            }
            
            if _item.getType() == "1" {
                return ImagesCollectionViewCell.getIdentify()
            } else if _item.getType() == "2" {
                return ImageCollectionViewCell.getIdentify()
            } else {
                return FeedCollectionViewCell.getIdentify()
            }
        }
        return FeedCollectionViewCell.getIdentify()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
