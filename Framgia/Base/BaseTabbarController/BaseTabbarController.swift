//
//  BaseTabbarController.swift
//  Framgia
//
//  Created by Pham Tien on 1/14/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import Foundation
import UIKit

class BaseTabbarController: UITabBarController, TabbarViewHandle
{
    var tabBarView = TabbarView.instanceFromNib()
    var tabBarIsShowMore:Bool = false
    
    func updateViewControllers(_ viewControllers:[BaseNaviController]) {
        self.viewControllers = viewControllers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabbarView()
    }
    
    // MARK: Tabbar
    func initTabbarView() {
        tabBarView.frame = CGRect(x: 0, y: DeviceManager.getWinSize().height - MyAppLication.NavigationBarHeight, width: DeviceManager.getWinSize().width, height: MyAppLication.NavigationBarHeight)
        tabBarView.delegate = self
        self.view.addSubview(tabBarView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func clickTab(_ sender: AnyObject, tabIndex: NSInteger) {
        self.selectedIndex = tabIndex
    }
    
    func showTabBarStateNormalWithAnimation(_ animation:Bool) {
        let duration:Double = animation ? 0.3 : 0

        UIView.animate(withDuration: duration, animations: {
            self.tabBarView.frame = CGRect(x: 0, y: DeviceManager.getWinSize().height - 50, width: DeviceManager.getWinSize().width, height: DeviceManager.getWinSize().height)
        }, completion: { (finish:Bool) in
            self.tabBarIsShowMore = false
        })
    }
}




