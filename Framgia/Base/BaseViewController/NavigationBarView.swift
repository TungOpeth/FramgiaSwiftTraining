//
//  NavigationBarView.swift
//  Framgia
//
//  Created by  on 8/9/16.
//  Copyright © 2016 framgia. All rights reserved.
//

import UIKit

@objc protocol NavigationHandle {
    @objc optional func clickLeftMenu(_ sender: AnyObject)
    @objc optional func clickRightMenu(_ sender: AnyObject)
    @objc optional func clickOtherMenu(_ sender: AnyObject)
    @objc optional func clickDropdown(_ sender: AnyObject)
    @objc optional func searchWithText(_ keyword: String?)
}

public enum NavigationType:Int {
    case standard = 0
    case dropdown = 1
    case naviSearch = 2
    case readMore = 3
}

class NavigationBarView: UIView {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var signOutButton: UIButton!
    
    @IBOutlet weak var otherButton: UIButton!
    
    @IBOutlet weak var arrowGenreImage: UIImageView!
    @IBOutlet weak var droplistButton: UIButton!
    @IBOutlet weak var drowdownView: UIView! {
        didSet{
            drowdownView?.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @IBOutlet weak var otherView: UIView!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var searchBarView: UIView!
    
    @IBOutlet weak var suggestSearchView: UIView!
    
    @IBOutlet weak var txtSearch: UITextField!
    
    var delegate : NavigationHandle?
    
    class func instanceFromNib(withType type:NavigationType) -> NavigationBarView {
        switch type {
        case .standard:
            return UINib(nibName: "NavigationBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        case .naviSearch:
            return UINib(nibName: "SearchNavigationBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        case .readMore:
            return UINib(nibName: "ReadMoreBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        default:
            return UINib(nibName: "NavigationBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! NavigationBarView
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.txtSearch?.delegate = self
    }
    
    func updateTitle(_ title:String) {
        lbTitle?.text = title
    }
    
    func hiddenOrtherButton(_ hidden:Bool) {
        self.otherButton?.isHidden = hidden
    }
    
    func hideSignoutBtn(_ hidden:Bool) {
        self.signOutButton.isHidden = hidden
    }
    
    func updateLeftBtn() {
        self.leftButton.setImage(UIImage(named: "navigationbar_back_icon.png"), for: UIControlState.normal)

    }
    
    func setupRightButton(_ img:String, hidden:Bool) {
        self.rightButton?.isHidden = hidden
        self.rightButton?.setImage(UIImage(named: img), for: UIControlState())
    }
    
    func showRightButton() {
        self.rightButton?.isHidden = false
    }

    var navigationBarType: NavigationType = .standard {
        didSet{
            switch navigationBarType {
            case .standard:
                lbTitle?.isHidden = false
                searchBarView?.isHidden = true
                break
            case .naviSearch:
                lbTitle?.isHidden = true
                searchBarView?.isHidden = false
                break
            case .readMore:
                lbTitle?.isHidden = false
                searchBarView?.isHidden = true
                break
            default:
                lbTitle?.isHidden = true
                searchBarView?.isHidden = true
                break
            }
        }
    }
    
    @IBAction func clickLeftButton(_ sender: AnyObject) {
        if delegate?.clickLeftMenu != nil {
            delegate?.clickLeftMenu!(sender)
        }
    }
    
    @IBAction func otherButtonClick(_ sender: AnyObject) {
        if delegate?.clickOtherMenu != nil {
            delegate?.clickOtherMenu!(sender)
        }
    }
    
    @IBAction func rightButtonClick(_ sender: AnyObject) {
        if delegate?.clickRightMenu != nil {
            let btn = sender as! UIButton
            btn.isSelected = !btn.isSelected
            delegate?.clickRightMenu!(sender)
        }
    }
    
    @IBAction func clickSearch(_ sender: AnyObject) {
        if delegate?.searchWithText != nil {
            delegate?.searchWithText!(txtSearch?.text)
        }
        self.endEditing(false)
    }
    
    @IBAction func clickSignOut(_ sender: AnyObject) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        didLogout()
    }
    
    func didLogout() {
        MainViewController.shared.showLoginView()
    }
}

extension NavigationBarView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if delegate?.searchWithText != nil {
            delegate?.searchWithText!(txtSearch?.text)
        }
        return true
    }
    
}
