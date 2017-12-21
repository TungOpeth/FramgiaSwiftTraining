//
//  FormValidationModel.swift
//  Framgia
//
//  Created by  on 11/16/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

struct FormValidationModel{
    //MARK-VARIABLES
    var email: String?
    var name: String?
    var phone: String?
    var password: String?
    
    //MARK: - CONSTRUCTORS
    init(userEmail: String?, userName: String?, userPhone: String?, userPassword: String?){
        email = userEmail
        name = userName
        phone = userPhone
        password = userPassword
    }
}
