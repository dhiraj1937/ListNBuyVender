//
//  HomViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 21/10/20.
//

import Foundation
import UIKit
import LPSnackbar
class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func btnOrder_Click(sender:UIButton){
        let vc = Constant.StoryBoard.instantiateViewController(withIdentifier: "SwipeOrdersViewController") as! SwipeOrdersViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
