//
//  SettingViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 22/10/20.
//

import Foundation
import UIKit
class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
     @IBAction func btnLogoutAction(_ sender: Any) {
        Constant.defaults.set("", forKey: "loginData")
        Constant.defaults.set(false, forKey: "loggedIn")
        Constant.defaults.synchronize()
        self.navigationController?.popToRootViewController(animated: true);
    }
    
}
