//
//  MyWKWebViewVC.swift
//  ListNBuyVender
//
//  Created by Rajesh Jayaswal on 26/10/20.
//

import UIKit
import WebKit
import LPSnackbar

class MyWKWebViewVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var strForPage:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHTMLString()
    }
    
    func loadHTMLString() {
        print(strForPage!)
        if KAPPDELEGATE.isInternetAvailable(){
            
            ApiManager.sharedInstance.requestGETURL(Constant.getPages_dbURL+"/"+strForPage!, success: { (JSON) in
                //let msg =  JSON[0].dictionary?["Message"]
                //print(msg!)
                if((JSON.dictionary?["IsSuccess"]) != false){
                    let htmlContent = JSON["ResponseData"][0]["Content"].stringValue
                    print(htmlContent)
                    DispatchQueue.main.async {
                        Helper.stopLoader()
                    }
                    self.webView.loadHTMLString(htmlContent, baseURL: nil)
                }
            },failure: { (Error) in
                DispatchQueue.main.async {
                    Helper.stopLoader()
                }
            })
            
        }else{
             LPSnackbar.showSnack(title: AlertMsg.warningToConnectNetwork)
        }
    }
    
 
    
}
