//
//  TabbarView.swift
//  Framgia
//
//  Created by Pham Tien on 1/14/17.
//  Copyright © 2017 framgia. All rights reserved.
//

import UIKit
import MediaPlayer

@objc protocol TabbarViewHandle {
    @objc optional func clickTab(_ sender: AnyObject, tabIndex:NSInteger)
    @objc optional func clickPlayer(_ sender: AnyObject)
}

class TabbarView: BaseUIView {
    @IBOutlet weak var _contentView: UIView!
    @IBOutlet weak var btnVideo: UIButton!
    @IBOutlet weak var btnHome:UIButton!
    
    var prevButton:UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
        prevButton = btnHome
    }
    
    func updateUI() {}
    
    class func instanceFromNib() -> TabbarView {
        return UINib(nibName: "TabbarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TabbarView
    }
    
    var delegate : TabbarViewHandle?
    
    @IBAction func selectTabIndex(_ sender: AnyObject) {
        let button:UIButton = sender as! UIButton
        if prevButton != nil {
            prevButton?.isSelected = false
        }
        prevButton = button
        prevButton?.isSelected = true
        
        if delegate?.clickTab != nil {
            delegate?.clickTab!(sender,tabIndex: button.tag)
        }
    }
    
    @IBAction func dubleclick(_ sender: AnyObject) {
//        MainViewController.shared.getRootnavigationController().popToRootViewController(animated: true)
    }
}
