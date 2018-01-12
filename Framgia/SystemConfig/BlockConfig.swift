//
//  BlockConfig.swift
//  BaseProject
//
//  Created by  on 6/3/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

typealias CompletionBlock = (_ result: JSON, _ usingCache: Bool) -> Void

typealias ErrorBlock = (_ error: Error?) -> Void
typealias ProgressBlock = (_ progress: CGFloat, _ url: URL) -> Void
//typealias DownloadComplete = (_ url: URL) -> Void
typealias CompleteBlock = ([NewsFeed]) -> Void
typealias ExtractComplete = ([Comment]) -> Void
