//
//  String+Editing.swift
//  Expenses
//
//  Created by Lana on 15/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation

public extension String {
    
    func replacingCharacters(in range: NSRange, with replacement: String) -> String {
        return (self as NSString).replacingCharacters(in: range, with: replacement)
    }
}
