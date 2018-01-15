//
//  BaseHeaderCollectionView.swift
//  BaseProject
//
//  Created by  on 6/2/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

class BaseHeaderCollectionView: UICollectionReusableView {
    
    class func nib() -> UINib{
        return UINib(nibName:String(describing: self), bundle: Bundle.main)
    }
    class func nibName() -> String{
        return String(describing: self)
    }
    
    class func getSize() -> CGSize{
        return CGSize(width: 50.0, height: 50.0)
    }
    
    func configHeaderWithData(_ data: AnyObject?){}
}
