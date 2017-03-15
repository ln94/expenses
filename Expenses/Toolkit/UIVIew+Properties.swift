//
//  UIVIew+Properties.swift
//
//  Created by Lana Shatonova on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    public var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    
    public var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    
    public var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            var frame = self.frame
            frame.size = newValue
            self.frame = frame
        }
    }
    
    public var top: CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }
    
    public var left: CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
        
    }
    
    public var bottom: CGFloat {
        get {
            return self.y + self.height
        }
        set {
            self.y = newValue - self.height
        }
    }
    
    public var right: CGFloat {
        get {
            return self.x + self.width
        }
        set {
            self.x = newValue - self.width
        }
    }
}
