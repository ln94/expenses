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
    
    let topBar: UIView = UIView()
    let titleLabel: UILabel = UILabel()
    let addButton: UIButton = UIButton()
    let backButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        topBar.addToSuperview(view, edge: .top, length: StatusBarHeight + TopBarHeight)
        topBar.backgroundColor = UIColor.white
        
        titleLabel.addToSuperview(topBar, edge: .top, length: TopBarHeight, insets: UIEdgeInsets(y: StatusBarHeight))
        titleLabel.textColor = UIColor.mainText
        titleLabel.font = UIFont.title
        titleLabel.textAlignment = .center
        
        addButton.addToSuperview(topBar, corner: .topRight, size: CGSize(width: TopBarHeight, height: TopBarHeight), insets: CGPoint(x: 0, y: StatusBarHeight))
        addButton.tintColor = UIColor.mainText
        addButton.setImage(Icon.add.image(), for: .normal)
        
        backButton.addToSuperview(topBar, corner: .topLeft, size: CGSize(width: TopBarHeight, height: TopBarHeight), insets: CGPoint(x: 0, y: StatusBarHeight))
        backButton.setImage(Icon.back.image(), for: .normal)
        backButton.tintColor = UIColor.mainText
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        
        let separator: UIView = UIView()
        separator.addToSuperview(topBar, edge: .bottom, length: 1)
        separator.backgroundColor = UIColor.topBarLine
    }
    
    override var title: String? {
        get {
            return titleLabel.text
        }
        set {
            if let title = newValue {
                titleLabel.attributedText = title.titleString()
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
    
    // MARK: - Buttons
    
    func backButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}
