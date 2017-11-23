//
//  LoginViewController.swift
//  Framgia
//
//  Created by  on 11/20/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var window: UIWindow?
    var tabBar: UITabBarController?

    @IBOutlet weak var txtMail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {    
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction
    func login(_ sender: AnyObject) {
        
        ServerFake.shareInstance.login(withUserName: txtMail.text, withPass: txtPassword.text, onComplete: { (user, cache) in
            UserHelper.shareInstance.didLogin(withUser:["mail":txtMail.text!,"password":txtPassword.text!])
            self.dismiss(animated: true, completion: {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                self.tabBar = (storyBoard.instantiateViewController(withIdentifier: "TimelineViewController") as! UITabBarController)
                self.window?.rootViewController = self.tabBarController
                self.window?.makeKeyAndVisible()
            })
        }, onError: {(error) in
            
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
