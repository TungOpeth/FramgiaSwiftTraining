//
//  MainViewController.swift
//  Framgia
//
//  Created by Minh Tien on 8/9/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainViewController: BaseTabbarController {
    static let shared = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showLoginView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Tab 1 Timeline
        let timeLine = TimelineViewController.newViewController()
        let timeLineNC = BaseNaviController(rootViewController: timeLine)
        timeLineNC.isNavigationBarHidden = true
        // Tab 2
        
        // Tab 3
        
        // Tab 4
        updateViewControllers([timeLineNC])
    }
    
    func getRootnavigationController() -> UINavigationController {
        return self.selectedViewController as! BaseNaviController
    }
    
    func showLoginView() {
        let loginViewController = LoginViewController.newViewController()
        self.present(loginViewController, animated: true, completion: nil)
    }
}
