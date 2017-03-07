//
//  MainViewController.swift
//  Expenses
//
//  Created by Lana Shatonova on 7/03/17.
//  Copyright © 2017 L. All rights reserved.
//

import UIKit
import RoamSwiftKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    private let titleLabel : UILabel = UILabel()
    private var scrollBars : [UIView] = []
    private let scrollView : UIScrollView = UIScrollView()
    
    private let VCs : [ScrollViewController] = [ExpensesViewController(), GoalsViewController(), AccountsViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        titleLabel.alignTo(edge: .top, length: 60, insets: UIEdgeInsets(top: 20, left: 60, bottom: 0, right: 60))
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        
        view.addSubview(scrollView)
        scrollView.fill(insets: UIEdgeInsets(top: 90, left: 0, bottom: 0, right: 0))
        scrollView.isPagingEnabled = true
        scrollView.canCancelContentTouches = true
        scrollView.delaysContentTouches = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentSize.width = CGFloat(VCs.count) * view.width
        scrollView.delegate = self
        
        for i : Int in 0...VCs.count - 1 {
            // Add VC view
            addChildViewController(VCs[i])
            scrollView.addSubview(VCs[i].view)
            VCs[i].view.x = CGFloat(i) * view.width
            
            // Add a bar
            let barWidth : CGFloat = (view.width - (CGFloat(VCs.count) + 1) * 10) / 3
            let barOffsetX : CGFloat = 10 + CGFloat(i) * (barWidth + 10)
            let bar : UIView = UIView(superview: view, corner: .topLeft, size: CGSize(width: barWidth, height: 5), offset: CGPoint(x: barOffsetX, y: 80))
            print(bar.x)
            bar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
            scrollBars.append(bar)
        }
        
        // Set initial values
        titleLabel.text = VCs.first?.title
        scrollBars.first?.backgroundColor = VCs.first?.color
    }
    

}

