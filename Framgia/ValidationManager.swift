//
//  ValidationManager.swift
//  Framgia
//
//  Created by  on 11/16/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

private let regexEmail = "[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}"
private let regexMobNo = "^[0-9]{6,15}$"
private let regexNameType = "^[a-zA-Z]+$"

func validateForm(signUpModel: FormValidationModel) -> ValidationError? {
    
    if signUpModel.email?.validateEmail() != nil {
        return signUpModel.email?.validateEmail()
    }
    
    if signUpModel.name?.validateName() != nil {
        return signUpModel.name?.validateName()
    }
    
    if signUpModel.phone?.validatePhone() != nil {
        return signUpModel.phone?.validatePhone()
    }
    
    if signUpModel.password?.validatePassword() != nil {
        return signUpModel.password?.validatePassword()
    }
    
    return ValidationError(code: 200, message: "Success!")
}

extension String {
    func validateEmail() -> ValidationError? {
        var validationError : ValidationError? = nil
        
        if self == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyEmail)
        }
        else {
            let emailTest = NSPredicate(format: "SELF MATCHES %@", regexEmail)
            let matchEmailId = emailTest.evaluate(with: self)
            if(!matchEmailId)
            {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidEmail, message: ValidationError.ErrorMessages.msgInvalidEmail)
            }
        }
        return validationError
    }
    
    func validateName() -> ValidationError? {
        var validationError : ValidationError? = nil
        if self == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyName)
        }
        else {
            
            let nameTest = NSPredicate(format: "SELF MATCHES %@", regexNameType)
            let matchNameType = nameTest.evaluate(with: self)
            if !matchNameType
            {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidName, message: ValidationError.ErrorMessages.msgInvalidName)
            }
        }
        return validationError

    }
    
    func validatePhone() -> ValidationError?{
        var validationError : ValidationError? = nil
        if self == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyMobileNo)
        }
        else {
            
            let mobileNoTest = NSPredicate(format: "SELF MATCHES %@", regexMobNo)
            let matchMobileNumber = mobileNoTest.evaluate(with: self)
            if(!matchMobileNumber)
            {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidMobileNo, message: ValidationError.ErrorMessages.msgInvalidMobileNo)
            }
        }
        return validationError
    }
    
    func validatePassword() -> ValidationError? {
        var validationError : ValidationError? = nil
        if self == "" {
            validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeEmptyText, message: ValidationError.ErrorMessages.msgEmptyPassword)
        }
        else {
            
            let passwordTest = NSPredicate(format: "SELF MATCHES %@", regexNameType)
            let matchPasswordType = passwordTest.evaluate(with: self)
            if !matchPasswordType
            {
                validationError = ValidationError(code: ValidationError.ErrorCodes.errorCodeInvalidName, message: ValidationError.ErrorMessages.msgInvalidPassword)
            }
        }
        return validationError
    }
}
