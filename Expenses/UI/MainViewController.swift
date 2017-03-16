//
//  MainViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 7/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MainViewController: NavigationViewController, UIScrollViewDelegate {
    
    private var scrollBar: UIView = UIView()
    private let scrollView: UIScrollView = UIScrollView()
    
    private let VCs : [ScrollViewController] = [ExpensesViewController(), GoalsViewController(), AccountsViewController()]
    
    private var _scrollIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationType = .add
        addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        
        scrollBar.addToSuperview(view, nextToView: topSeparator, corner: .bottomLeft, size: CGSize(width: view.width / 3, height: 1.5), insets: CGPoint(x: 0, y: -1.5))
        scrollBar.backgroundColor = UIColor.mainText
        
        scrollView.fillSuperview(view, insets: UIEdgeInsets(top: scrollBar.bottom))
        scrollView.isPagingEnabled = true
        scrollView.canCancelContentTouches = true
        scrollView.delaysContentTouches = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize.width = CGFloat(VCs.count) * view.width
        scrollView.delegate = self
        
        for i: Int in 0...VCs.count - 1 {
            scrollView.addSubview(VCs[i].view)
            VCs[i].view.height = scrollView.height
            VCs[i].view.x = CGFloat(i) * view.width
        }
        
        // Initial
        title = VCs[0].title
    }

    var scrollIndex: Int {
        get {
            return _scrollIndex
        }
        set {
            _scrollIndex = newValue
            
            scrollBar.x = CGFloat(newValue) * scrollBar.width
            
            UIView.animate(withDuration: 0.1, animations: {
                self.titleLabel.alpha = 0
                
            }) { (_) in
                self.title = self.VCs[newValue].title
                UIView.animate(withDuration: 0.2, animations: {
                    self.titleLabel.alpha = 1
                })
            }
        }
    }
    
    func addButtonPressed() {
        var vcToPresent: UIViewController? = nil
        switch scrollIndex {
            
        case 0:
            vcToPresent = AddExpenseViewController()
            break
            
        case 2:
            vcToPresent = AddAccountViewController()
            break
            
        default:
            break
        }
        if let vc = vcToPresent {
            present(vc, animated: true, completion: nil)
        }
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollBar.x = scrollView.contentOffset.x / 3
        
        switch scrollView.contentOffset.x {
        case 0:
            self.scrollIndex = 0
            break
            
        case view.width:
            self.scrollIndex = 1
            break
            
        case 2 * view.width:
            self.scrollIndex = 2
            break
            
        default:
            break
        }
    }
    
}

