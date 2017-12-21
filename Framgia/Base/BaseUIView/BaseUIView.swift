//
//  BaseUIView.swift
//  Framgia
//
//  Created by Pham Minh Tien on 11/7/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import Foundation
import UIKit

open class BaseUIView: UIView {
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBInspectable var _borderWidth:CGFloat = 0.0 {
        didSet {
            layer.borderWidth = _borderWidth
        }
    }
    
    @IBInspectable var _borderColor:UIColor = UIColor.clear {
        didSet {
            layer.borderColor = _borderColor.cgColor
        }
    }
    
    @IBInspectable var _cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = _cornerRadius
        }
    }

}
@IBDesignable extension UIView {
    public class func fromNib(_ nibNameOrNil: String? = nil) -> Self {
        return fromNib(nibNameOrNil, type: self)
    }
    
    public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T {
        let v: T? = fromNib(nibNameOrNil, type: T.self)
        return v!
    }
    
    public class func fromNib<T : UIView>(_ nibNameOrNil: String? = nil, type: T.Type) -> T? {
        var view: T?
        let name: String
        if let nibName = nibNameOrNil {
            name = nibName
        } else {
            // Most nibs are demangled by practice, if not, just declare string explicitly
            name = _nibName
        }
        let nibViews = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        for v in nibViews! {
            if let tog = v as? T {
                view = tog
            }
        }
        return view
    }
    
    public class var _nibName: String {
        let name = "\(self)".components(separatedBy: ".").first ?? ""
        return name
    }
    public class var _nib: UINib? {
        if let _ = Bundle.main.path(forResource: _nibName, ofType: "nib") {
            return UINib(nibName: _nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
}

@IBDesignable  class TranparentView: UIView {
    
}
