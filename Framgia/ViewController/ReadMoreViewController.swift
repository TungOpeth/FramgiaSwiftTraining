//
//  ReadMoreViewController.swift
//  Framgia
//
//  Created by  on 1/8/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

class ReadMoreViewController: BaseViewController, NavigationHandle, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var feed = NewsFeed(json: ["":""])
    
    var comments: [Comment]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(ImagesCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImagesCollectionViewCell.getIdentify())
        collectionView.register(ImageCollectionViewCell.getNib(), forCellWithReuseIdentifier: ImageCollectionViewCell.getIdentify())
        collectionView.register(CommentCollectionViewCell.getNib(), forCellWithReuseIdentifier: CommentCollectionViewCell.getIdentify())
        setupNavigation()
        feed?.showFull = true
        
        comments = feed?.getlistComment()
        collectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        feed?.showFull = false
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 + Int((comments?.count)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            if let item = feed {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: getCellIdentify(withItem: item, false), for: indexPath)
                (cell as! BaseCollectionViewCell).configCell(item)
                return cell
            }
        } else {
            if let items = comments {
                let item = items[indexPath.row - 1]
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommentCollectionViewCell", for: indexPath)
                (cell as! BaseCollectionViewCell).configCell(item)
                return cell
            }
        }
        let profileCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.getIdentify(), for: indexPath)
        return profileCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            if let item = feed {
                if (getCellClass(withItem: item) as BaseCollectionViewCell.Type).responds(to: #selector(BaseCollectionViewCell.getSizeWithItem)) {
                    return (getCellClass(withItem: item) as BaseCollectionViewCell.Type).getSizeWithItem(withItem: item)
                }
                return (getCellClass(withItem: item) as BaseCollectionViewCell.Type).getSize()
            }
        } else {
            if let items = comments {
                    let item = items[indexPath.row - 1]
                    let des = item.content
                    
                    let messageHeight = des.height(withConstrainedWidth: DeviceManager.getWinSize().width - 40, font: UIFont.systemFont(ofSize: 15))
                    
                    let height = 91  +  messageHeight
                    return CGSize (width: DeviceManager.getWinSize().width, height: height )
                }
                return CGSize(width:  DeviceManager.getWinSize().width, height: 300)
        }
        return CGSize.zero
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
    
    func setupNavigation() {
        initNavigationBar()
        if let newsfeed = feed {
            myNavigationBar?.updateTitle(newsfeed.userName)
        }
        myNavigationBar?.delegate = self
        myNavigationBar?.hiddenOrtherButton(true)
        myNavigationBar?.hideSignoutBtn(true)
        myNavigationBar?.updateLeftBtn()
    }
    //MARK: Navigation delegate
    func clickLeftMenu(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func clickRightMenu(_ sender: AnyObject) {
        
    }
    
    func clickOtherMenu(_ sender: AnyObject) {
        
    }
}
