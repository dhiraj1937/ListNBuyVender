//
//  ProfileViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 21/10/20.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imgVUserProfile: UIImageView!
    @IBOutlet weak var txtFName: RJBorderedTF!
    @IBOutlet weak var txtFMobile: RJBorderedTF!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtFName.isUserInteractionEnabled = false;
        txtFMobile.isUserInteractionEnabled = false;
        
        imgVUserProfile.layer.cornerRadius = imgVUserProfile.frame.size.height/2
        imgVUserProfile.layer.borderWidth = 2
        imgVUserProfile.layer.borderColor = UIColor.yellow.cgColor
        imgVUserProfile.clipsToBounds = true
        
        txtFName.text = AppUserDefaults.userName
        txtFMobile.text = AppUserDefaults.userMobile
        
        imgVUserProfile.downloaded(from:AppUserDefaults.userImg!)

    }
    
}
