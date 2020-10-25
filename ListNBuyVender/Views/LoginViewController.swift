//
//  LoginViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 21/10/20.
//

import Foundation
import UIKit
import LPSnackbar

class LoginViewController: UIViewController {
    @IBOutlet weak var txtFMobile: RJBorderedTF!
    @IBOutlet weak var txtfPassword: RJBorderedTF!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtFMobile.text = "1234567890";
        txtfPassword.text = "123456";
        
        if AppUserDefaults.isLoggedIn {
            DispatchQueue.main.async {
                let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.show(controller, sender: self)
            }
        }
    }
    
    func validateFields() -> Bool{
        
        if txtFMobile.text!.count == 0 {
            LPSnackbar.showSnack(title: AlertMsg.enterMobileNo)
            return false}
        
        if txtFMobile.text!.count != 10 {
            LPSnackbar.showSnack(title: AlertMsg.mobileNoLength)
            return false}
        
        if txtfPassword.text!.count   == 0 {
            LPSnackbar.showSnack(title: AlertMsg.enterPassword)
            return false}
        
        return true
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {
        //Validate Fileds
        if !validateFields() { return }
        let dicParm :[String:Any] = ["Phone": self.txtFMobile.text!, "Password": self.txtfPassword.text!]
        if KAPPDELEGATE.isInternetAvailable(){
            self.Login(dicParam: dicParm,vc: self);
        }else{
             LPSnackbar.showSnack(title: AlertMsg.warningToConnectNetwork)
        }
    }
    
    func Login(dicParam:[String:Any],vc:UIViewController){
        DispatchQueue.main.async {
            Helper.showLoader()
        }
        ApiManager.sharedInstance.requestPOSTURL(Constant.loginUrl, params: dicParam, success: {(JSON) in
           
            let msg =  JSON.dictionary?["Message"]?.stringValue
            print(msg as Any)

            if((JSON.dictionary?["IsSuccess"]) != false){
                let name = JSON["ResponseData"][0]["Name"].stringValue
                print(name)
                let phone = JSON["ResponseData"][0]["Phone"].stringValue
                print(phone)
                
                let strImage = JSON["ResponseData"][0]["Image"].stringValue
                let userId = JSON["ResponseData"][0]["Id"].stringValue
                print(strImage)
                
                AppUserDefaults.isLoggedIn = true
                AppUserDefaults.userName = name
                AppUserDefaults.userMobile = phone
                AppUserDefaults.userImg = strImage
                AppUserDefaults.userId = userId
                Constant.defaults.synchronize()
                
                DispatchQueue.main.async {
                    Helper.stopLoader()
                }
                LPSnackbar.showSnack(title: AlertMsg.LoginSuccess)
                self.navigatToHome()
            }
        },failure: { (Error) in
            DispatchQueue.main.async {
                Helper.stopLoader()
            }
        })
        
    }
    
    func navigatToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.show(controller, sender: self)
        }
    }
}
