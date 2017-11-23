//
//  ServerFake.swift
//  BaseProject
//
//  Created by Pham Minh Tien on 11/20/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit

typealias TestCompletionBlock = (_ result: [String:String?], _ usingCache: Bool) -> Void
typealias TestErrorBlock = (_ error: String?) -> Void

class ServerFake: NSObject{
    static var shareInstance = ServerFake()
    
    func login(withUserName user_name:String?,
               withPass pass:String?,
               onComplete completion: TestCompletionBlock,
               onError errorBlock: TestErrorBlock){
        if user_name != nil && pass != nil {
            completion(["user_name":user_name, "pass":pass], false)
        } else {
            errorBlock("UserName or password is nil")
        }
    }
    
    func register(withUserName user_name:String?,
                  withEmail email:String?,
                  withPhone phone:String?,
                  withPass pass:String?,
                  onComplete completion: TestCompletionBlock, onError errorBlock: TestErrorBlock) {
        if user_name != nil && email != nil && phone != nil && pass != nil {
            completion(["user_name":user_name, "email":email, "phone":phone, "pass":pass], false)
        } else {
            errorBlock("UserName or password is nil")
        }
    }

}
