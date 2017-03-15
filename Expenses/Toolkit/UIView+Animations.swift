//
//  UIView+Animations.swift
//  Expenses
//
//  Created by Lana on 15/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public extension UIView {
    
    func shake(completion: ((Bool) -> Swift.Void)? = nil) {
        let shake = CAKeyframeAnimation(keyPath: "transform.translation.x")
        shake.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        shake.duration = 0.2
        shake.values = [9.0, -9.0, -6.0, 6.0, -3.0, 3.0, 0.0]
        
        layer.add(shake, forKey: "shake")
        layer.add(shake, forKey: "shake")
    }
}
