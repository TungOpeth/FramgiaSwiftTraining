//
//  Appdelegate+initialApplication.swift
//  Framgia
//
//  Created by Fra-TienPM on 12/21/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

extension AppDelegate {
    func initApplication() {
        let main = MainViewController.shared;
        
        self.window?.rootViewController = MainViewController.shared
    }
}
