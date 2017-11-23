//
//  UserHelper.swift
//  Framgia
//
//  Created by  on 11/20/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class UserHelper: NSObject {

    static let shareInstance = UserHelper()
    
    var userDiction: [String:String]?

    func logout() {
        UserDefaults.standard.set(false, forKey: "didLogin")
    }
    
    func checkLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: "didLogin")
    }
    
    func didLogin(withUser user:[String:String]?) {
        UserDefaults.standard.set(true, forKey: "didLogin")
        userDiction = user
    }
    
    func getUserName() -> String? {
        if let user = userDiction {
            return user["user_name"]
        }
        return ""
    }
    
    func getEmail() -> String {
        return ""
    }
    
    
    func showLogin() {
//        if (!checkLogin()){
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let login = storyBoard.instantiateViewController(withIdentifier: "LoginViewController")
//            UIApplication.shared.delegate
////            tabBarController.show(login, sender: nil)
//        }
    }
}
