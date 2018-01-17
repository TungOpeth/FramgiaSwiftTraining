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
    var showFull = false
    var objectDict:[String:JSON]?
    fileprivate var _userName: String!
    fileprivate var _content: String!
    fileprivate var _liked: String!
    fileprivate var _commented: String!
    fileprivate var _avatarURL: String!
    fileprivate var _postType: String!
    fileprivate var _numberOfPreviewImages: Int! = 0
    fileprivate var images:[NSDictionary]?
    
    
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
    
    var avatarURL: String {
        if _avatarURL == nil {
            _avatarURL = ""
        }
        return _avatarURL
    }
    
    var postType: String {
        if _postType == nil {
            _postType = ""
        }
        return _postType
    }
    
    var numberOfPreviewImages: Int {
        if _numberOfPreviewImages == nil {
            _numberOfPreviewImages = 0
        }
        return _numberOfPreviewImages
    }
    
    init?(json: [String: JSON]) {
        guard let userName = json["display_name"]?.string,
            let content = json["content_decoded"]?.string,
            let liked = json["liked"]?.string,
            let commented = json["commented"]?.string,
            let postType = json["post_type"]?.string,
            let avatarURL = json["avatar"]?.string,
            let previewImagesJSON = json["attachments"]?.string
            else {
                return nil
        }
        self.objectDict = json
        self._userName = userName
        self._content = content
        self._liked = liked
        self._commented = commented
        self._postType = postType
        self._avatarURL = avatarURL
        self._numberOfPreviewImages = previewImagesJSON.components(separatedBy: "},{").count
        getImageURLs(numberOfImages: self._numberOfPreviewImages, previewImagesJSON: previewImagesJSON)
    }
    
    class func downloadNewsFeeds(completed: @escaping CompleteBlock){
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
    
    class func LoadMoreNewsFeeds(completed: @escaping CompleteBlock, startIndex: Int){
        let url = URL(string: LOAD_MORE_NEWS_FEED_URL + "start=\(startIndex)&limit=20")!
        
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
    
    
    private func getImageURLs(numberOfImages: Int, previewImagesJSON: String) {
        if let list = self.convertToDictionary(text: previewImagesJSON) as? [NSDictionary] {
            images = list
        }
    }
    
    func convertToDictionary(text: String) -> Any? {
        
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? Any
            } catch {
                print(error.localizedDescription)
            }
        }
        
        return nil
        
    }
    
    func getType() -> String {
        if self._postType == "images" && self._numberOfPreviewImages > 1 {
            return "1"
        } else if self._postType == "images" && self._numberOfPreviewImages == 1 {
            return "2"
        } else if self._postType == "videos"{
            return "0"
        } else {
            return "0"
        }
    }
    
    
    func getImageAtIndex(_ index:Int) -> String? {
        if let _images = images {
            if index < _images.count {
                return _images[index]["src"] as? String
            }
        }
        return ""
    }
    
    func getlistComment() -> [Comment]? {
        if let json = self.objectDict {
            if let listCommentJson  = json["comments"]?.array {
                var results:[Comment] = []
                for comment in listCommentJson {
                    if let commentItem = Comment(json: comment.dictionaryValue) {
                        results.append(commentItem)
                    }
                }
                return results
            }
        }
        return nil
    }
}
