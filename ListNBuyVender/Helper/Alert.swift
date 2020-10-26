//
//  Alert.swift
//  ListNBuyVender
//
//  Created by Rajesh Jayaswal on 23/10/20.
//  Copyright © 2020 Rajesh Jayaswal. All rights reserved.
//
import Foundation

struct AlertTitle {
    static let K_alert = "Alert"
    static let K_success  = "Success"
    static let K_failed  = "Failed"
}

//Common Strings or Hardcode strings
let K_YES    = "Yes"
let K_NO     = "No"
let K_OK     = "Ok"
let K_CANCEL = "Cancel"
let K_DONE   = "Done"

//All APIS
struct AlertMsg {
    static let warningToConnectNetwork = "Please check your network connection."
    static let APIFailed = "Something went wrong."
    
    static let LoginSuccess = "Login Successfull !"
    static let enterMobileNo = "Please enter mobile number."
    static let enterPassword = "Please enter password."
    static let mobileNoLength = "Mobile number should be equal to 10 digits!"
    
    static let enterConfirmPassword = "Please enter confirm password."
    static let passwordNotMatching = "Confirm password does not match."
    static let AvilibilitySuccess = "Avilibility Added Successfully !"
}
