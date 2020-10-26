//
//  AvailabilityViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 24/10/20.
//

import Foundation
import UIKit
import LPSnackbar

class AvailabilityViewController: UIViewController {
    
    @IBOutlet weak var viewSelectDate: UIView!
    @IBOutlet weak var tblView: UITableView!
    let datePicker = UIDatePicker()
    var dateSelected = ""
    var listAvailability = [[String:Any]]()
    
    @IBOutlet weak var myDateTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        viewSelectDate.isHidden = true;
        self.myDateTextField.setInputViewDatePicker(target: self, selector: #selector(tapDone)) //1
//        let image = UIImage.init(named: "LoginPassIcon")
//        let iconView = UIImageView(frame:CGRect(x: 10, y: 0, width: 50, height: self.myDateTextField.frame.height))
//            iconView.image = image
//        let iconContainerView: UIView = UIView(frame:CGRect(x: 20, y: 0, width: 50
//            , height: self.myDateTextField.frame.height))
//            iconContainerView.addSubview(iconView)
//            self.myDateTextField.leftView = iconContainerView
//            self.myDateTextField.leftViewMode = .always
        self.getAvailabilityData()
    }
    
    func getAvailabilityData(){
        if KAPPDELEGATE.isInternetAvailable(){
                    DispatchQueue.main.async {
                        Helper.showLoader()
                    }
                ApiManager.sharedInstance.requestGETURL(Constant.getAvailibilityURL+"/"+AppUserDefaults.userId!, success: { (JSON) in
                        let msg =  JSON[0].dictionary?["Message"]
                        if((JSON[0].dictionary?["IsSuccess"]) != false){
                            self.listAvailability.removeAll()
                            self.listAvailability = ((JSON[0].dictionaryObject!["ResponseData"]) as? [[String:Any]])!;
                            print( self.listAvailability as Any)
                        }
                        else{
                            LPSnackbar.showSnack(title: msg!.description)
                        }
                        DispatchQueue.main.async {
                            Helper.stopLoader()
                        }
                        self.tblView.reloadData()
                    },failure:{ (Error) in
                        LPSnackbar.showSnack(title: Error.localizedDescription)
                        DispatchQueue.main.async {
                            Helper.stopLoader()
                        }
                    })
        }
        else{
             LPSnackbar.showSnack(title: AlertMsg.warningToConnectNetwork)
        }
    }
    
    @IBAction func btnAddActionToShowView(_ sender: Any) {
        dateSelected = "";
        self.view.addSubview(viewSelectDate);
        viewSelectDate.center = self.view.center;
        viewSelectDate.isHidden = false;
    }
    
    @IBAction func btnCloseAction(_ sender: Any) {
        viewSelectDate.isHidden = true;
    }
    
    @IBAction func btnSubmitAction(_ sender: Any) {

        if KAPPDELEGATE.isInternetAvailable(){
             let dicParm :[String:Any] = ["deliveryboyId": AppUserDefaults.userId!, "Date": dateSelected]
            ApiManager.sharedInstance.requestPOSTURL(Constant.addAvailibilityURL, params: dicParm, success: {(JSON) in
               
                if((JSON.dictionary?["IsSuccess"]) != false){
                    DispatchQueue.main.async {
                        Helper.stopLoader()
                    }
                    self.getAvailabilityData()
                    self.btnCloseAction(sender)
                    LPSnackbar.showSnack(title: AlertMsg.AvilibilitySuccess)
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
    
    @objc func tapDone() {
           if let datePicker = self.myDateTextField.inputView as? UIDatePicker {
               let dateformatter = DateFormatter()
               dateformatter.dateFormat = "dd-MM-yyyy"
               self.myDateTextField.text = dateformatter.string(from: datePicker.date)
               dateformatter.dateFormat = "yyyy-MM-dd"
               dateSelected = dateformatter.string(from: datePicker.date)
           }
           self.myDateTextField.resignFirstResponder()
       }
  
}

// MARK: - UITableViewDataSource
extension AvailabilityViewController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAvailability.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "AvailabilityCell", for: indexPath) as! AvailabilityCell
         cell.SetData(dic: listAvailability[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
