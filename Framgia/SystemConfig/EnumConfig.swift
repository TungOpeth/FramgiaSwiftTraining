//
//  EnumConfig.swift
//  BaseProject
//
//  Created by  on 6/3/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import Foundation


enum API_METHOD: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}

enum UIUserInterfaceIdiom : Int {
    case unspecified
    case phone // iPhone and iPod touch style UI
    case pad // iPad style UI
}


enum TableControllerState: Int {
    case Normal = 0
    case LoadingMore = 1
    case UsingCache = 2
    case NoLoadMore = 3
}

enum DescriptionState: Int {
    case descriptionStateShort = 0
    case descriptionStateFull = 1
    case descriptionStateFullOnly = 2
}


enum PLAYER_STATE: Int {
    case PLAYER_STATE_STOP = 0
    case PLAYER_STATE_PLAYING = 1
    case PLAYER_STATE_PAUSE = 2
}


enum PlayerShuffleState: Int {
    case No_Shuffle = 0
    case Shuffle = 1
}

enum PlayerRepeateState: Int {
    case No_repeat = 0
    case Repeat_one = 1
    case Repeat_all = 2
}

enum PlayerToolBarState: Int {
    case isShowing = 0
    case isHidden = 1
}

enum HQLink: Int {
    case normal = 0
    case hdLink = 1
}

enum MediaState: String {
    case recent = "recent"
    case favorite = "favorite"
    case downloaded = "downloaded"
}

enum DiscoveryCollectionType: String {
    case BannerHeader = "banner"
    case ListBook = "book-horizontal"
    case ListBookNews = "book-hot"
    case ListCollection = "book-collection"
}

enum BannerType: Int {
    case Google = 0
    case Facebook = 1
}


