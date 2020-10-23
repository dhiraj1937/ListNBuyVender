//
//  OrdersViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 23/10/20.
//

import Foundation
import UIKit
import SwipeMenuViewController
class SwipeOrdersViewController: SwipeMenuViewController {

    private var tabs: [String] = ["TODAY","DONE", "UPCOMING", "FAILD"]
    var options = SwipeMenuViewOptions()
    
    var dataCount: Int = 0
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tabs.forEach { data in
            let vc = OrderListViewController()
            vc.title = data
            self.addChild(vc)
        }
        dataCount=4;
        reload();
        // Do any additional setup after loading the view.
    }
    
    private func reload() {
        options.tabView.style = .segmented
        options.tabView.backgroundColor = UIColor.init(red: 172/255, green: 78/255, blue: 230/255, alpha: 1)
        options.tabView.itemView.textColor = UIColor.white;
        options.tabView.itemView.selectedTextColor = UIColor.white;
        options.tabView.additionView.backgroundColor = UIColor.red
        swipeMenuView.reloadData(options: options)
    }

    // MARK: - SwipeMenuViewDelegate

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewWillSetupAt: currentIndex)
        print("will setup SwipeMenuView")
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        super.swipeMenuView(swipeMenuView, viewDidSetupAt: currentIndex)
        print("did setup SwipeMenuView")
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, willChangeIndexFrom: fromIndex, to: toIndex)
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        super.swipeMenuView(swipeMenuView, didChangeIndexFrom: fromIndex, to: toIndex)
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }


    // MARK - SwipeMenuViewDataSource

    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return dataCount
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return children[index].title ?? ""
    }

    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        let vc = children[index]
        vc.didMove(toParent: self)
        return vc
    }
    
}
