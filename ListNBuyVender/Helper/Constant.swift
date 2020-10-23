//
//  Constant.swift
//  ListNBuyVender
//
//  Created by Apple on 21/10/20.
//

import Foundation
import UIKit

let KAPPDELEGATE = UIApplication.shared.delegate as! AppDelegate

public class Constant {
    
    
    //All storyboard
    let Kwidth  = UIScreen.main.bounds.size.width
    let Kheight = UIScreen.main.bounds.size.height
    
    public static let defaults = UserDefaults.standard
    
    public static var APIKey:String = "123456789123456789"
    private static var serverURL:String = "https://projects.seawindsolution.com/YOGDEV/360/Webservices"
    //private static var serverURL:String = "https://www.podahmedabad.com/Webservices"
    public static var loginUrl:String = Constant.serverURL+"/deliveryBoyLogin";
}


class AppUserDefaults {
    
    static var isLoggedIn:Bool{
        set{
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        }
        get{
            return UserDefaults.standard.value(forKey: "isLoggedIn") as? Bool ?? false
        }
    }
    
    static var userName:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
        get{
            return UserDefaults.standard.value(forKey: "userName") as? String
        }
    }
    
    static var userMobile:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "userMobile")
        }
        get{
            return UserDefaults.standard.value(forKey: "userMobile") as? String
        }
    }
    
    static var userImg:String?{
        set{
            UserDefaults.standard.set(newValue, forKey: "userImg")
        }
        get{
            return UserDefaults.standard.value(forKey: "userImg") as? String
        }
    }
    
    
}
