//
//  RegisterViewController.swift
//  Framgia
//
//  Created by  on 11/16/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import UIKit

class RegisterViewController: BaseViewController {

    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickRegister(_ sender: Any) {
        let validation = FormValidationModel(userEmail: txtMail.text!, userName: txtName.text!, userPhone: txtPhone.text!, userPassword: txtPassword.text!)
        
        if((validateForm(signUpModel: validation)?.errorCode) != 200){
            let alert = UIAlertController(title: "Register Failed", message: validateForm(signUpModel: validation)?.errorString, preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let information = String(format:"Name: %@\rMail: %@\rPhone: %@\r",txtName.text!, txtMail.text!, txtPhone.text!)
            
            let caution = UIAlertController(title: "Register Successfully", message: information, preferredStyle: UIAlertControllerStyle.alert)
            
            caution.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                action in
                self.dismiss(animated: true, completion: nil) 
            }))
            
            self.present(caution, animated: true, completion: nil)
        }
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
