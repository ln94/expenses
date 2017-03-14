//
//  MainViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 7/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit

class MainViewController: NavigationViewController, UIScrollViewDelegate {
    
    override var navigationType: NavigationType {
        return .add
    }
    
    private var scrollBar: UIView = UIView()
    private let scrollView: UIScrollView = UIScrollView()
    
    private let VCs : [ScrollViewController] = [ExpensesViewController(), GoalsViewController(), AccountsViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollBar.addToSuperview(view, edge: .top, size: CGSize(width: view.width / 3, height: 1.5), inset: StatusBarHeight + TopBarHeight - 1)
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
        
        setCurrentVC(index: 0)
    }

    func setCurrentVC(index: Int) {
        let vc: ScrollViewController = VCs[index]
        
        UIView.animate(withDuration: 0.2) { 
            self.title = vc.title
            self.scrollBar.x = CGFloat(index) * self.scrollBar.width
        }
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.contentOffset.x {
        case 0:
            setCurrentVC(index: 0)
            break
            
        case view.width:
            setCurrentVC(index: 1)
            break
            
        case 2 * view.width:
            setCurrentVC(index: 2)
            break
            
        default:
            break
        }
    }
}

