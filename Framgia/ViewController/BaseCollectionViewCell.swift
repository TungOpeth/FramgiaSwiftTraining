//
//  BaseCollectionViewCell.swift
//  Framgia
//
//  Created by  on 12/27/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    class func getSize() -> CGSize {
        return CGSize(width: 50, height: 50)
    }
    
    func configCell(_ item: AnyObject)  {
        
    }
    
    class func getIdentify() -> String {
        return String(describing: self)
    }
    
    class func getNib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}


