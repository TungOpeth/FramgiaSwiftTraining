//
//  ValidationError.swift
//  Framgia
//
//  Created by  on 11/16/17.
//  Copyright © 2017 Framgia. All rights reserved.
//

import Foundation

struct ValidationError {
    
    var errorCode: Int!
    var errorString: String!
    
    init(code: Int, message: String) {
        
        errorCode = code
        errorString = message
    }
    
    struct ErrorCodes {
        
        static let errorCodeEmptyText = 3003
        static let errorCodeInvalidAlphaNumericTest = 3006
        static let errorCodeInvalidMobileNo = 3008
        static let errorCodeMaxLengthExceed = 3009
        static let errorCodeInvalidName = 3010
        static let errorCodeInvalidPassword = 3011
        static let errorCodeInvalidEmail = 3004
    }
    
    struct ErrorMessages {
        
        static let msgEmptyEmail = "Please enter your Email Address"
        static let msgInvalidEmail = "Please enter a valid Email Address"
        static let msgEmptyName = "Please enter your Name"
        static let msgEmptyPassword = "Please enter your Password"
        static let msgInvalidAlphaNumericTest = "Please enter a valid AlphaNumeric Text"
        static let msgEmptyMobileNo = "Please enter mobile Number"
        static let msgInvalidMobileNo = "Please enter a valid mobile number"
        static let msgLimitedText = "Please enter text upto the specified limit"
        static let msgInvalidName = "Please enter a valid Name"
        static let msgInvalidPassword = "Please enter a valid Password"
        static let msgEmptyText = "Please enter the text"
    }
}
