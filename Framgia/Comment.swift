//
//  Comment.swift
//  Framgia
//
//  Created by  on 1/9/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class Comment {
    fileprivate var _userName: String!
    fileprivate var _content: String!
    fileprivate var _liked: String!
    fileprivate var _replied: String!
    fileprivate var _avatarURL: String!

    var userName: String {
        if _userName == nil {
            _userName = ""
        }
        return _userName
    }
    
    var content: String {
        if _content == nil {
            _content = ""
        }
        return _content
    }
    
    var liked: String {
        if _liked == nil {
            _liked = "0"
        }
        return _liked
    }
    
    var replied: String {
        if _replied == nil {
            _replied = ""
        }
        return _replied
    }
    
    var avatarURL: String {
        if _avatarURL == nil {
            _avatarURL = ""
        }
        return _avatarURL
    }
    
    init?(json: [String: JSON]) {
        guard let userName = json["display_name"]?.string,
            let content = json["content_decoded"]?.string,
            let liked = json["liked"]?.string,
            let replied = json["total_replies"]?.string,
            let avatarURL = json["avatar"]?.string
            else {
                return nil
        }
        self._userName = userName
        self._content = content
        self._liked = liked
        self._replied = replied
        self._avatarURL = avatarURL
    }
}
