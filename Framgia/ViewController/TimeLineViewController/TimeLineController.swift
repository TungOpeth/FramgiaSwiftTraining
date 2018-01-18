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
    
    override func loadMoreContent(startIndex: Int) {
        self.tableState = .LoadingMore
        super.loadMoreContent(startIndex: startIndex)
        NewsFeed.LoadMoreNewsFeeds(completed: { (items) in
            self.addEntityForSection(newItem: items, atSection: 0)
        }, startIndex: startIndex)
    }
    
    override func registerNibWithColletion(_ collectionView: UICollectionView) {
        collectionView.register(ProfileCollectionViewCell.getNib(), forCellWithReuseIdentifier: ProfileCollectionViewCell.getIdentify())
        
        collectionView.register(FeedCollectionViewCell.getNib(), forCellWithReuseIdentifier: FeedCollectionViewCell.getIdentify())
        
        collectionView.register(StatusCollectionViewCell.getNib(), forCellWithReuseIdentifier: StatusCollectionViewCell.getIdentify())
        
        collectionView.register(ImagesCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImagesCollectionViewCell.getIdentify())
        
        collectionView.register(ImageCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImageCollectionViewCell.getIdentify())
        
        collectionView.register(LoadingCollectionViewCell.getNib(), forCellWithReuseIdentifier: LoadingCollectionViewCell.getIdentify())
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
        } else if item is String {
            if returnNameClass {
                return NSStringFromClass(LoadingCollectionViewCell.self)
            } else {
                return LoadingCollectionViewCell.getIdentify()
            }
        }
        return FeedCollectionViewCell.getIdentify()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
