//
//  TimelineViewController.swift
//  Framgia
//
//  Created by  on 11/17/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class TimelineViewController: BaseViewController, NavigationHandle {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var controller: TimeLineController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        
        controller = TimeLineController.init(initWithTargetCollection: collectionView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        controller.setUpEgoRefreshHeader()
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
