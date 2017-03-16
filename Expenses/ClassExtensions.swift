//
//  ClassExtensions.swift
//  Expenses
//
//  Created by Lana Shatonova on 16/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Int: for amounts

extension Int64 {
    
    var double: Double {
        return Double(self) / 100
    }
    
    var string: String {
        return String(format: "%.2f", arguments: [self.double])
    }
}

// MARK: 

extension String {
    
    func subtitleString() -> NSAttributedString {
        return NSAttributedString(string: self, attributes: [NSForegroundColorAttributeName: UIColor.subtitle,
                                                             NSFontAttributeName: UIFont.subtitle,
                                                             NSKernAttributeName: 2])
    }
    
    func actionButtonString() -> NSAttributedString {
        return NSAttributedString(string: self.uppercased(), attributes: [NSForegroundColorAttributeName: UIColor.mainText,
                                                               NSFontAttributeName: UIFont.title,
                                                               NSKernAttributeName : 2])
    }
}
