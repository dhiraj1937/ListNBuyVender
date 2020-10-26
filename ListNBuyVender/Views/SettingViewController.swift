//
//  SettingViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 22/10/20.
//

import Foundation
import UIKit
import LPSnackbar
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
    
    @IBAction func btnGetHTMLPagesAction(_ sender: UIButton) {
        if KAPPDELEGATE.isInternetAvailable(){
            var strForPage = "about-us"
                   if sender.tag == 111 {
                      strForPage = "about-us"
                   }else if sender.tag == 222 {
                       strForPage = "privacy-policy"
                   }else if sender.tag == 333 {
                       strForPage = "terms-and-conditions"
                   }else{
                       strForPage = "about-us"
                   }
                   DispatchQueue.main.async {
                       let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyWKWebViewVC") as! MyWKWebViewVC
                    controller.strForPage = strForPage;
                       self.show(controller, sender: self)
                   }
        }else{
         LPSnackbar.showSnack(title: AlertMsg.warningToConnectNetwork)
        }
    }
}
