//
//  LoginViewController.swift
//  Framgia
//
//  Created by Fra-TienPM on 12/21/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction
    func clickRegister(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        MainViewController.shared.showRegisterView()
    }
    
    @IBAction
    func clickLogin(_ sender: AnyObject) {
        
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
