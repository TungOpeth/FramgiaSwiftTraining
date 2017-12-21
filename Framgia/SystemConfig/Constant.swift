//
//  Constant.swift
//  BaseProject
//
//  Created by  on 8/9/17.
//  Copyright © 2016 framgia. All rights reserved.
//

import Foundation
import UIKit

let APPDELEGATE = UIApplication.shared.delegate

enum MyAppLication {
    static let ApplicationName = ""
    static let Version = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") ?? "0") as! String
    static let Build = (Bundle.main.object(forInfoDictionaryKey: "CFBundleShortBuildString") ?? "0") as! String
    static let FeedbackEmail = ""
    static let NavigationBarHeight:CGFloat = 60.0
    static let TabbarHeight:CGFloat = 50
}

enum PLaceholder {
    static let AvatarPlaceHolder = UIImage(named: "")
    
}
