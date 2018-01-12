//
//  BaseColletionController.swift
//  BaseProjectSwift
//
//  Created by Minh Tien on 4/9/16.
//  Copyright © 2016 MTLABSWIFT. All rights reserved.
//

import Foundation
import UIKit

class BaseCollectionController: NSObject,UICollectionViewDelegate {
    var _targetCollectionView : UICollectionView?
    var items = [[AnyObject]]()
    var sections = [AnyObject]()
    var tableState: TableControllerState = .Normal
    let limit:Int = 20
    var startIndex:Int = 0
    
    
    var isLoadingRefreshHeader = false
    
    var refreshHeaderView = MTTableViewPullRefresh(frame: CGRect.zero, arrowImageName: "blueArrow.png", textColor: UIColor(red: 87.0/255.0, green: 108.0/255.0, blue: 137.0/255.0, alpha: 1.0))
    
    convenience init(_ targetCollection: UICollectionView) {
        self.init()
        _targetCollectionView = targetCollection
        _targetCollectionView?.delegate = self;
        _targetCollectionView?.dataSource = self;
        registerNibWithColletion(targetCollection)
//        setUpEgoRefreshHeader()
    }
    
    func initWithTargetCollectionView(_ targetCollection: UICollectionView) {
        _targetCollectionView = targetCollection
        _targetCollectionView?.delegate = self;
        _targetCollectionView?.dataSource = self;
        registerNibWithColletion(targetCollection)
//        setUpEgoRefreshHeader()
    }

    func getCellClass(_ indexPath: IndexPath) -> BaseCollectionViewCell.Type {
        let item = self.itemAtIndexPath(indexPath)
        let className = self.getCellIndenifi(item, returnNameClass: true)
        return NSClassFromString(className) as! BaseCollectionViewCell.Type
    }
    
    func getHeaderClassAtIndex(_ section: Int) -> BaseHeaderCollectionView.Type! {
        let item = self.getSectionItem(sectionIndex: section)
        let className = self.getHeaderSection(item, returnNameClass: true, withSection: section)
        if className != nil {
            return NSClassFromString(className!) as! BaseHeaderCollectionView.Type
        }
        return nil
    }
    
    func getFooterClassAtIndex(_ section: Int) -> BaseHeaderCollectionView.Type! {
        let item = self.getSectionItem(sectionIndex: section)
        let className = self.getFooterSection(item, returnNameClass: true, withSection: section)
        if className != nil {
            return NSClassFromString(className!) as! BaseHeaderCollectionView.Type
        }
        return nil
    }
    
    func getListItem(sectionIndex section:Int) ->[AnyObject]{
        return items[section] as [AnyObject]
    }
    
    func getSectionItem(sectionIndex section: Int) -> AnyObject! {
        if section > 0, sections.count > section {
            return sections[section] as AnyObject
        }
        return nil
    }
    
    func itemAtIndexPath(_ indextPath: IndexPath) -> AnyObject? {
        if(items.count > indextPath.section){
            let item = items[indextPath.section]
            if(item.count > indextPath.row){
                return item[indextPath.row] as AnyObject
            }
        }
        return nil
    }
    // Update new list
    func updateWithListItem(_ listitem: [AnyObject]){
        items.removeAll()
        items.append(listitem)
        _targetCollectionView?.reloadData()
    }

    func updateWithListItem(_ listitem: [[AnyObject]], listSection:[AnyObject]){
        items.removeAll()
        items += listitem
        sections.removeAll()
        sections += listSection
        _targetCollectionView?.reloadData()
    }
    
    // Update entity of section
    func addEntityForSection(newItem _newItem:[AnyObject], atSection section:Int) {
        self.items[section].append(contentsOf: _newItem)
        _targetCollectionView?.reloadData()
    }

    func reloadCollectionView() {
        _targetCollectionView?.reloadData()
    }
    
    func setUpEgoRefreshHeader() {
        isLoadingRefreshHeader = false
        refreshHeaderView.frame = CGRect(x: refreshHeaderView.frame.origin.x,
                                         y: refreshHeaderView.frame.origin.y,
                                         width:DeviceManager.getWinSize().width ,
                                         height: refreshHeaderView.frame.size.height)
        
        refreshHeaderView.backgroundColor = UIColor.white
        refreshHeaderView.delegate = self
        _targetCollectionView?.addSubview(self.refreshHeaderView)
    }
    
    func loadMoreContent() {}
    
    
    //MARK: MT refresh header protocol
    func doneLoadingTableViewData() {
        isLoadingRefreshHeader = false
        if let tartgetCollection = _targetCollectionView {
            refreshHeaderView.egoRefreshScrollViewDataSourceDidFinishedLoading(tartgetCollection)
        }
    }
    
    //MARK: Require Override function
    func registerNibWithColletion(_ collectionView: UICollectionView) { assert(false, "This is an abstract method and should be overridden")}
    
    func getCellIndenifi(_ item: AnyObject?, returnNameClass: Bool) -> String {
        assert(false, "This is an abstract method and should be overridden")
        return ""
    }
    
    //MARK: Optional Function
    func getHeaderSection(_ item: AnyObject?, returnNameClass: Bool,withSection section:Int) -> String! { return nil }
    func getFooterSection(_ item: AnyObject?, returnNameClass: Bool,withSection section:Int) -> String! { return nil }
    
    func refreshHeaderDidChange() {
        isLoadingRefreshHeader = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}


extension BaseCollectionController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row > collectionView.numberOfItems(inSection: 0)  - 6 {
            if tableState == .Normal {
                loadMoreContent()
            }
        }
        let item = self.itemAtIndexPath(indexPath)
        let cellIdentify = self.getCellIndenifi(item, returnNameClass: false)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentify,  for:indexPath)
        let baseCell = cell as! BaseCollectionViewCell
        baseCell.configCell(item);
        baseCell.indexPath = indexPath
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let number = items[section].count
        return number
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let number = items.count
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var reusableView: BaseHeaderCollectionView! = nil
        var item:AnyObject!
        if sections.count > indexPath.section {
            item = sections[indexPath.section]
        }
        
        if (kind == UICollectionElementKindSectionHeader) {
            let headerclass = self.getHeaderClassAtIndex(indexPath.section)
            let collectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: (headerclass?.nibName())!, for: indexPath)
            reusableView = collectionHeader as? BaseHeaderCollectionView
            reusableView.configHeaderWithData(item)
        } else if (kind == UICollectionElementKindSectionFooter) {
            let headerclass = self.getFooterClassAtIndex(indexPath.section)
            let collectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: (headerclass?.nibName())!, for: indexPath)
            reusableView = collectionFooter as! BaseHeaderCollectionView
            reusableView.configHeaderWithData(nil)
        }
        return reusableView;
    }
}

extension BaseCollectionController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellClass = self.getCellClass(indexPath)
        return cellClass.getSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if (self.perform(#selector(self.getHeaderClassAtIndex)) != nil) {
            let header = self.getHeaderClassAtIndex(section)
            return header!.getSize()
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if let header = self.getFooterClassAtIndex(section) {
            return header.getSize()
        }
        return CGSize.zero
    }
}

extension BaseCollectionController:MTTableViewPullRefreshDelegate {
    func egoRefreshTableHeaderDidTriggerRefresh(_ sideMenu: MTTableViewPullRefresh){
        refreshHeaderDidChange()
        self.perform(#selector(BaseCollectionController.doneLoadingTableViewData), with: nil, afterDelay: 1)
    }
    
    func egoRefreshTableHeaderDataSourceIsLoading(_ sideMenu: MTTableViewPullRefresh)-> Bool {
        return isLoadingRefreshHeader
    }
    
    func egoRefreshTableHeaderDataSourceLastUpdated(_ sideMenu: MTTableViewPullRefresh) -> Date {
        return Date()
    }
}


extension BaseCollectionController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        refreshHeaderView.egoRefreshScrollViewDidScroll(scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        refreshHeaderView.egoRefreshScrollViewDidEndDragging(scrollView)
    }
}

