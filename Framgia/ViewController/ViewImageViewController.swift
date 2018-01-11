//
//  ViewImageViewController.swift
//  Framgia
//
//  Created by  on 1/11/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit
import ImageSlideshow
import SDWebImage

class ViewImageViewController: BaseViewController, NavigationHandle {
    
    @IBOutlet var slideShow: ImageSlideshow!
    
    var feed = NewsFeed(json: ["":""])
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        
        slideShow.backgroundColor = UIColor.white
//        slideShow.slideshowInterval = 5.0
        slideShow.pageControlPosition = PageControlPosition.underScrollView
        slideShow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        slideShow.pageControl.pageIndicatorTintColor = UIColor.black
        slideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
        
        var sdWebImageSource:[SDWebImageSource] = []
        
        for index in 0...((feed?.numberOfPreviewImages)! - 1) {
           if let img = SDWebImageSource(urlString: (feed?.getImageAtIndex(index))!)
           {
            sdWebImageSource.append(img)
            }
        }
        
        slideShow.setImageInputs(sdWebImageSource)
        
        
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
