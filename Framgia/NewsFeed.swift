//
//  NewsFeed.swift
//  Framgia
//
//  Created by  on 12/28/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire


class NewsFeed{
    fileprivate var _userName: String!
    fileprivate var _content: String!
    fileprivate var _liked: String!
    fileprivate var _commented: String!
    fileprivate var _imageURL: String!
    
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

    var commented: String {
        if _commented == nil {
            _commented = ""
        }
        return _commented
    }
    
    var imageURL: String {
        if _imageURL == nil {
            _imageURL = ""
        }
        return _imageURL
    }
    
    init?(json: [String: JSON]) {
        guard let userName = json["display_name"]?.string,
            let content = json["content_decoded"]?.string,
            let liked = json["liked"]?.string,
            let commented = json["commented"]?.string,
            let imageURL = json["avatar"]?.string
            else {
                return nil
        }
        
        self._userName = userName
        self._content = content
        self._liked = liked
        self._commented = commented
        self._imageURL = imageURL
    }
    
    class func downloadNewsFeeds(completed: @escaping DownloadComplete){
        let url = URL(string: NEWS_FEED_URL)!
        
        var newsFeeds: [NewsFeed] = []
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).downloadProgress { (progress) in
            
        }.responseJSON { (response) in
            if((response.result.value) != nil) {
                let swiftyJsonVar = JSON(response.result.value!)
                if let datas = swiftyJsonVar["data"].array {
                    for case let data in datas {
                        if let newsFeed = NewsFeed(json: data.dictionaryValue){
                            newsFeeds.append(newsFeed)
                        }
                    }
                }
                
            completed(newsFeeds)
            }
        }
    }
    
    func getType() -> String {
        return "0"
    }
}
