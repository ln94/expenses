//
//  NavigationViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 14/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {
    
    public enum NavigationType {
        case add
        case back
        case none
        case both
    }
    
    private var _navigationType: NavigationType = .both
    
    let titleLabel: UILabel = UILabel()
    let addButton: UIButton = UIButton()
    let backButton: UIButton = UIButton()
    let separator: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        titleLabel.addToSuperview(view, edge: .top, length: TopBarHeight, insets: UIEdgeInsets(y: StatusBarHeight))
        titleLabel.textColor = UIColor.mainText
        titleLabel.font = UIFont.title
        titleLabel.textAlignment = .center
        
        addButton.addToSuperview(view, corner: .topRight, size: CGSize(width: TopBarHeight, height: TopBarHeight), insets: CGPoint(x: 0, y: StatusBarHeight))
        addButton.setImage(UIImage(named: Icon.add), for: .normal)
        addButton.tintColor = UIColor.mainText
        
        backButton.addToSuperview(view, corner: .topLeft, size: CGSize(width: TopBarHeight, height: TopBarHeight), insets: CGPoint(x: 0, y: StatusBarHeight))
        backButton.setImage(UIImage(named: Icon.back), for: .normal)
        backButton.tintColor = UIColor.mainText
        
        separator.addToSuperview(view, nextToView: titleLabel, edge: .bottom, length: 1)
        separator.backgroundColor = UIColor.topBarLine
    }
    
    override var title: String? {
        get {
            return titleLabel.text
        }
        set {
            if let title = newValue {
                titleLabel.attributedText = NSAttributedString(string: title.uppercased(), attributes: [NSKernAttributeName : 2])
            }
            else {
                titleLabel.text = nil
            }
        }
    }
    
    var navigationType: NavigationType {
        get {
            return _navigationType
        }
        set {
            _navigationType = newValue
            
            switch newValue {
                
            case .add:
                backButton.alpha = 0
                break
                
            case .back:
                addButton.alpha = 0
                break
                
            case .none:
                addButton.alpha = 0
                backButton.alpha = 0
                break
                
            case .both:
                break
            }
        }
    }
}
