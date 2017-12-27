//
//  BaseViewController.swift
//  Framgia
//
//  Created by Minh Tien on 4/9/17.
//  Copyright © 2016 MTLABSWIFT. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: GAITrackedViewController, UIGestureRecognizerDelegate {
    var nibName_: String?
    var myNavigationBar: NavigationBarView?

    
    class func initUsingStoryboard(storyboardName storyName: String, withIndetifier indentifier:String ) -> UIViewController{
        let storyboard = UIStoryboard(name: storyName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: indentifier)
    }
    
    class func initUsingStoryboard(storyboardName storyboardname: String) -> UIViewController{
        let  storyboard = UIStoryboard(name: storyboardname, bundle: nil)
        let indentyfier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: indentyfier)
    }
    
    convenience init(usingNib _nibName:String) {
        self.init(nibName:_nibName, bundle: nil)
    }

    class func newViewController() -> UIViewController{
        let  storyboard = UIStoryboard(name: "Main", bundle: nil)
        let indentyfier = String(describing: self)
        return storyboard.instantiateViewController(withIdentifier: indentyfier)
    }
    
    class func nibName() -> String{
        return String(describing: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if #available(iOS 7.0, *), self.navigationController != nil {
            self.navigationController?.interactivePopGestureRecognizer?.delegate = self
            if self.navigationController?.viewControllers.count == 1 {
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            }else {
                self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    // MARK: Navigation Bar
    func initNavigationBar() {
        myNavigationBar = NavigationBarView.instanceFromNib(withType: NavigationType.standard)
        myNavigationBar?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: MyAppLication.NavigationBarHeight)
        self.view.addSubview(myNavigationBar!)
        myNavigationBar?.navigationBarType = .standard
    }
    
    func initNavigtionBarSearch() {
        myNavigationBar = NavigationBarView.instanceFromNib(withType: NavigationType.naviSearch)
        myNavigationBar?.frame = CGRect(x: 0, y: 0, width: DeviceManager.getWinSize().width, height: MyAppLication.NavigationBarHeight)
        self.view.addSubview(myNavigationBar!)
        myNavigationBar?.navigationBarType = .naviSearch
    }
    
    
}

