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
    }
    
    var navigationType: NavigationType {
        return .none
    }
    
    private let titleLabel: UILabel = UILabel()
    private let separator: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        titleLabel.addToSuperview(view, edge: .top, length: TopBarHeight, insets: UIEdgeInsets(y: StatusBarHeight))
        titleLabel.textColor = UIColor.mainText
        titleLabel.font = UIFont.title
        titleLabel.textAlignment = .center
        
        title = "Expenses"
        
        if navigationType == .add {
            let addButton: UIButton = UIButton()
            addButton.addToSuperview(view, corner: .topRight, size: CGSize(width: TopBarHeight, height: TopBarHeight), insets: CGPoint(x: 0, y: StatusBarHeight))
            addButton.setImage(UIImage(named: Icon.add), for: .normal)
            addButton.tintColor = UIColor.mainText
            addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        }
        else if navigationType == .back {
            let backButton: UIButton = UIButton()
            backButton.addToSuperview(view, corner: .topLeft, size: CGSize(width: TopBarHeight, height: TopBarHeight), insets: CGPoint(x: 0, y: StatusBarHeight))
            backButton.setImage(UIImage(named: Icon.back), for: .normal)
            backButton.tintColor = UIColor.mainText
            backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        }
        
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
    
    func addButtonPressed() { }
    
    func backButtonPressed() { }
}
