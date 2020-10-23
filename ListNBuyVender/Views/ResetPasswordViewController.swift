//
//  ProfileViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 21/10/20.
//

import Foundation
import UIKit

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var txtFCPassword: RJBorderedTF!
    @IBOutlet weak var txtFNewPassword: RJBorderedTF!
    @IBOutlet weak var txtFRePassword: RJBorderedTF!


    override func viewDidLoad() {
        super.viewDidLoad()
        txtFCPassword.text = "";
        txtFNewPassword.text = "";
        txtFRePassword.text = "";
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {
        
    }
    
}
