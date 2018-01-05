//
//  TimelineViewController.swift
//  Framgia
//
//  Created by  on 11/17/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class TimelineViewController: BaseViewController, NavigationHandle, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var newsFeed = NewsFeed(json: ["user_title":"","content_decoded":"","liked":""])
    var newsFeeds: [NewsFeed]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(ProfileCollectionViewCell.getNib(), forCellWithReuseIdentifier: ProfileCollectionViewCell.getIdentify())
        
        collectionView.register(FeedCollectionViewCell.getNib(), forCellWithReuseIdentifier: FeedCollectionViewCell.getIdentify())
        
        collectionView.register(StatusCollectionViewCell.getNib(), forCellWithReuseIdentifier: StatusCollectionViewCell.getIdentify())
        
        collectionView.register(ImagesCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImagesCollectionViewCell.getIdentify())
        
        collectionView.register(ImageCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImageCollectionViewCell.getIdentify())
        
        
        NewsFeed.downloadNewsFeeds(completed: { (items) in
            self.newsFeeds = items
            self.collectionView.reloadData()
        })
        
        setupNavigation()
        collectionView.reloadData()
    }

    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard (newsFeeds != nil) else {
            return 0
        }
        return (newsFeeds?.count)!
    }
    
    func getCellIdentify(withItem _item: NewsFeed,_ isClass: Bool) -> String {
        if isClass {
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
    
    func getCellClass(withItem _item: NewsFeed) -> BaseCollectionViewCell.Type {
        let cellId = self.getCellIdentify(withItem: _item, true)
        return NSClassFromString(cellId) as! BaseCollectionViewCell.Type
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let items = newsFeeds {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: getCellIdentify(withItem: item, false), for: indexPath)
            (cell as! BaseCollectionViewCell).configCell(item)
            return cell
        }
        
        let profileCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.getIdentify(), for: indexPath)
        return profileCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let items = newsFeeds {
            let item = items[indexPath.row]
            if (getCellClass(withItem: item) as BaseCollectionViewCell.Type).responds(to: #selector(BaseCollectionViewCell.getSizeWithItem)) {
                return (getCellClass(withItem: item) as BaseCollectionViewCell.Type).getSizeWithItem(withItem: item)
            }
            return (getCellClass(withItem: item) as BaseCollectionViewCell.Type).getSize()
        }
        return CGSize.zero
    }
    
    func setupNavigation() {
        initNavigtionBarSearch()
        myNavigationBar?.updateTitle("TimeLine")
        myNavigationBar?.delegate = self
        myNavigationBar?.hiddenOrtherButton(true)
    }
    //MARK: Navigation delegate
    func clickLeftMenu(_ sender: AnyObject) {
        
    }
    
    func clickRightMenu(_ sender: AnyObject) {
    }
    
    func clickOtherMenu(_ sender: AnyObject) {
        
    }
    

}
