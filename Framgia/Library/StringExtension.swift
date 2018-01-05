//
//  StringExtension.swift
//  Framgia
//
//  Created by  on 1/5/18.
//  Copyright © 2018 Framgia. All rights reserved.
//

import Foundation

extension String{
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
