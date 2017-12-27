//
//  TimelineViewController.swift
//  Framgia
//
//  Created by  on 25/17/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, NavigationHandle, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var listItems:[[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
        
        
        collectionView.register(UINib.init(nibName: "ProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        collectionView.register(UINib.init(nibName: "StatusCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StatusCollectionViewCell")
        collectionView.register(UINib.init(nibName: "FeedCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeedCollectionViewCell")
        
        setupNavigation()
        
        listItems = [["title":"Cell 1", "type":"1"],["title":"Cell 2", "type":"2"],["title":"Cell 3", "type":"3"],["title":"Cell 4", "type":"3"]]
        collectionView.reloadData()
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard (listItems != nil) else {
            return 0
        }
        return (listItems?.count)!
    }
    
    func getCellIdentify(withItem _item: [String: String],_ isClass: Bool) -> String {
        if isClass {
            if _item["type"] == "1" {
                return NSStringFromClass(ProfileCollectionViewCell.self)
            } else if _item["type"] == "2" {
                return NSStringFromClass(StatusCollectionViewCell.self)
            } else {
                return NSStringFromClass(FeedCollectionViewCell.self)
            }
        }
        
        if _item["type"] == "1" {
            return ProfileCollectionViewCell.getIdentify()
        } else if _item["type"] == "2" {
            return StatusCollectionViewCell.getIdentify()
        } else {
            return FeedCollectionViewCell.getIdentify()
        }
    }
    
    func getCellClass(withItem _item: [String: String]) -> BaseCollectionViewCell.Type {
        let cellId = self.getCellIdentify(withItem: _item, true)
        return NSClassFromString(cellId) as! BaseCollectionViewCell.Type
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        if let items = listItems {
            let item = items[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: getCellIdentify(withItem: item, false), for: indexPath)
            return cell
        }
        
        let profileCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.getIdentify(), for: indexPath)
        return profileCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let items = listItems {
            let item = items[indexPath.row]
            return (getCellClass(withItem: item) as BaseCollectionViewCell.Type).getSize()
        }
        return CGSize.zero
    }
    
    func setupNavigation() {
        initNavigtionBarSearch()
        myNavigationBar?.updateTitle("Profile")
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
