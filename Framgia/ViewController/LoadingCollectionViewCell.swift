//
//  LoadingCollectionViewCell.swift
//  Framgia
//
//  Created by  on 1/16/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import UIKit

class LoadingCollectionViewCell: BaseCollectionViewCell {

    override class func getSize() -> CGSize {
        return CGSize(width: DeviceManager.getWinSize().width, height: 104)
    }
    
    override class func getSizeWithItem(withItem item: AnyObject) -> CGSize {
        return CGSize(width: DeviceManager.getWinSize().width, height: 104)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
