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
        titleLabel.font = UIFont.systemFont(ofSize: 18)
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
            
            let barWidth : CGFloat = (view.width - 2 * 5) / 3
            let barOffsetX : CGFloat = CGFloat(i) * (barWidth + 5)
            let bar : UIView = UIView(superview: view, corner: .topLeft, size: CGSize(width: barWidth, height: 2), offset: CGPoint(x: barOffsetX, y: 80))
            bar.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
            scrollBars.append(bar)
        }
        
        setScrollVC(index: 0)
    }
    
    func setScrollVC(index: Int) {
        let vc: ScrollViewController = VCs[index]
        
        UIView.animate(withDuration: 0.2) { 
            self.titleLabel.attributedText = NSAttributedString(string: (vc.title!).uppercased(), attributes: [NSKernAttributeName : 2])
            for i in 0...self.scrollBars.count - 1 {
                if i == index {
                    self.scrollBars[i].backgroundColor = UIColor.black //vc.color
                }
                else {
                    self.scrollBars[i].backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
                }
            }
        }
    }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.contentOffset.x {
        case 0:
            setScrollVC(index: 0)
            break
            
        case view.width:
            setScrollVC(index: 1)
            break
            
        case 2 * view.width:
            setScrollVC(index: 2)
            break
            
        default:
            break
        }
    }
}

