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
var check_index = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if checkLogin() == false {
            showLoginView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLoggedIn")
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
        let profile = ProfileViewController.newViewController()
        let profileNC = BaseNaviController(rootViewController: profile)
        profileNC.isNavigationBarHidden = true
        
        // Tab 3
        let more = MoreViewController.newViewController()
        let moreNC = BaseNaviController(rootViewController: more)
        moreNC.isNavigationBarHidden = true
        
        // Tab 4
        updateViewControllers([timeLineNC, profileNC, moreNC])
    }
    
    func getRootnavigationController() -> UINavigationController {
        return self.selectedViewController as! BaseNaviController
    }
    
    func showLoginView() {
        let loginViewController = LoginViewController.newViewController()
        self.present(loginViewController, animated: true, completion: nil)
  
    }
    
    func  showRegisterView()  {
        let register = RegisterViewController.newViewController()
        APPDELEGATE?.window??.rootViewController?.present(register, animated: true, completion: nil)
    }
}
