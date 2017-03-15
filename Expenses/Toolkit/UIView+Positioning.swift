//
//  UIView+Positioning.swift
//
//  Created by Lana Shatonova on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    public init(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) {
        self.top = top
        self.left = left
        self.bottom = bottom
        self.right = right
    }
    
    public init(x: CGFloat = 0, y: CGFloat = 0) {
        self.init(top: y, left: x, bottom: y, right: x)
    }
}

public extension UIView {
    
    // Edges
    
    public enum Edge {
        case top
        case right
        case bottom
        case left
    }
    
    // Corners
    
    public enum Corner {
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
    }
    
    // Positioning
    
    public func fillSuperview(_ superview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        superview.addSubview(self)
        
        self.size = CGSize(width: superview.width - insets.left - insets.right, height: superview.height - insets.top - insets.bottom)
        self.x = insets.left
        self.y = insets.top
    }
    
    public func addToSuperview(_ superview: UIView, edge: Edge, size: CGSize, inset: CGFloat = 0) {
        
        superview.addSubview(self)
        self.size = size
        
        switch edge {
            
        case .top:
            self.x = (superview.width - size.width) / 2
            self.y = inset
            break
            
        case .bottom:
            self.x = (superview.width - size.width) / 2
            self.bottom = superview.height - inset
            break
            
        case .left:
            self.x = inset
            self.y = (superview.height - size.height) / 2
            break
            
        case .right:
            self.right = superview.width - inset
            self.y = (superview.height - size.height) / 2
            break
        }
    }
    
    public func addToSuperview(_ superview: UIView, edge: Edge, length: CGFloat, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        
        superview.addSubview(self)
        
        switch edge {
            
        case .top:
            self.size = CGSize(width: superview.width - insets.left - insets.right, height: length)
            self.y = insets.top
            self.x = insets.left
            break
            
        case .bottom:
            self.size = CGSize(width: superview.width - insets.left - insets.right, height: length)
            self.bottom = superview.height - insets.bottom
            self.x = insets.left
            break
            
        case .left:
            self.size = CGSize(width: length, height: superview.height - insets.top - insets.bottom)
            self.x = insets.left
            self.y = insets.top
            break
            
        case .right:
            self.size = CGSize(width: length, height: superview.height - insets.top - insets.bottom)
            self.right = superview.width - insets.right
            self.y = insets.top
            break
        }
    }
    
    public func addToSuperview(_ superview: UIView, corner: Corner, size: CGSize, insets: CGPoint = CGPoint.zero) {
        
        superview.addSubview(self)
        self.size = size
        
        switch corner {
            
        case .topLeft:
            self.x = insets.x
            self.y = insets.y
            break
            
        case .topRight:
            self.right = superview.width - insets.x
            self.y = insets.y
            break
            
        case .bottomLeft:
            self.x = insets.x
            self.bottom = superview.height - insets.y
            break
            
        case .bottomRight:
            self.right = superview.width - insets.x
            self.bottom = superview.height - insets.y
            break
        }
    }
    
    public func addToSuperview(_ superview: UIView, nextToView: UIView, edge: Edge, size: CGSize, inset: CGFloat = 0) {
        
        superview.addSubview(self)
        self.size = size
        
        switch edge {
            
        case .top:
            self.x = nextToView.x + (nextToView.width - size.width) / 2
            self.y = nextToView.y - inset
            break
            
        case .bottom:
            self.x = nextToView.x + (nextToView.width - size.width) / 2
            self.y = nextToView.bottom + inset
            break
            
        case .left:
            self.right = nextToView.x - inset
            self.y = nextToView.y + (nextToView.height - size.height) / 2
            break
            
        case .right:
            self.x = nextToView.right + inset
            self.y = nextToView.y + (nextToView.height - size.height) / 2
            break
        }
    }
    
    public func addToSuperview(_ superview: UIView, nextToView: UIView, edge: Edge, length: CGFloat, insets: CGPoint = CGPoint.zero) {
        
        superview.addSubview(self)
        
        switch edge {
            
        case .top:
            self.size = CGSize(width: nextToView.width - 2 * insets.x, height: length)
            self.x = nextToView.x + insets.x
            self.y = nextToView.y - insets.y
            break
            
        case .bottom:
            self.size = CGSize(width: nextToView.width - 2 * insets.x, height: length)
            self.x = nextToView.x + insets.x
            self.y = nextToView.bottom + insets.y
            break
            
        case .left:
            self.size = CGSize(width: length, height: nextToView.height - 2 * insets.y)
            self.right = nextToView.x - insets.x
            self.y = nextToView.y + insets.y
            break
            
        case .right:
            self.size = CGSize(width: length, height: nextToView.height - 2 * insets.y)
            self.x = nextToView.right + insets.x
            self.y = nextToView.y + insets.y
            break
        }
    }
    
    public func addToSuperview(_ superview: UIView, nextToView: UIView, corner: Corner, size: CGSize, insets: CGPoint = CGPoint.zero) {
        
        superview.addSubview(self)
        self.size = size
        
        switch corner {
            
        case .topLeft:
            self.x = nextToView.x + insets.x
            self.bottom = nextToView.y - insets.y
            break
            
        case .topRight:
            self.right = nextToView.right - insets.x
            self.bottom = nextToView.y - insets.y
            break
            
        case .bottomLeft:
            self.x = nextToView.x + insets.x
            self.y = nextToView.bottom + insets.y
            break
            
        case .bottomRight:
            self.right = nextToView.right - insets.x
            self.bottom = nextToView.bottom + insets.y
            break
        }
    }
}
