//
//  Constants.swift
//  Expenses
//
//  Created by Lana on 13/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Dimensions

var StatusBarHeight: CGFloat {
    return UIApplication.shared.statusBarFrame.height
}

var TopBarHeight: CGFloat {
    return 44.0
}

struct Padding {
    static let tiny: CGFloat = 5.0
    static let small: CGFloat = 12.0
    static let medium: CGFloat = 20.0
}

// MARK: - Colors

extension UIColor {
    
    static var mainText: UIColor {
        return UIColor(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha: 1.0)
    }
    
    static var subtitleText: UIColor {
        return UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
    }
    
    static var topBarLine: UIColor {
        return UIColor(red: 230.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    }
    
    static var line: UIColor {
        return UIColor(red: 239.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    }
}

// MARK: - Icons

struct Icon {
    static let add: String = "AddIcon"
    static let back: String = "BackIcon"
}

// MARK: - Fonts

extension UIFont {
    
    static var title: UIFont {
        return UIFont.systemFont(ofSize: 18)
    }
}
