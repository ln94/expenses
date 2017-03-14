//
//  Constants.swift
//  Expenses
//
//  Created by Lana on 13/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// MARK: - Dimensions

var StatusBarHeight: CGFloat {
    return UIApplication.shared.statusBarFrame.height
}

var TopBarHeight: CGFloat {
    return 44
}

var ButtonSize: CGSize {
    return CGSize(width: 100, height: 44)
}

struct Padding {
    static let tiny: CGFloat = 5
    static let small: CGFloat = 10
    static let medium: CGFloat = 20
    static let large: CGFloat = 30
}

// MARK: - Colors

extension UIColor {
    
    static var mainText: UIColor {
        return UIColor(red: 43.0/255.0, green: 43.0/255.0, blue: 43.0/255.0, alpha: 1.0)
    }
    
    static var subtitle: UIColor {
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
    static let add: String = "Add"
    static let back: String = "Back"
}

// MARK: - Fonts

extension UIFont {
    
    static var title: UIFont {
        return UIFont.systemFont(ofSize: 17)
    }
    
    static var subtitle: UIFont {
        return UIFont.systemFont(ofSize: 13)
    }
    
    static var mainText: UIFont {
        return UIFont.systemFont(ofSize: 15)
    }
}

// MARK: - Core Data

var Manager: DataManager {
    return AppDelegate.shared.dataManger
}

var Context: NSManagedObjectContext {
    return AppDelegate.shared.persistentContainer.viewContext
}
