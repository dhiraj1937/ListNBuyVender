//
//  OrderListViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 23/10/20.
//

import Foundation
import UIKit
import LPSnackbar
class OrderListViewController: UIViewController {
    
    @IBOutlet var tblTodayOrders:UITableView!
    var listOrders = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tblTodayOrders.reloadData()
    }
    
    //TO GET THE LIST OF TODAYS ORDER
    public func GetOrders(status:Int){
        do{
            try
                listOrders = [[String:Any]]()
                tblTodayOrders.reloadData()
                DispatchQueue.main.async {
                    Helper.showLoader()
                }
                var method:String = Constant.getTodayOrderURL;
                if(status==0){
                    method = Constant.getTodayOrderURL;}
                else  if(status==1){
                    method = Constant.getDONEOrderURL;}
                else  if(status==2){
                    method = Constant.getUpComingOrderURL;}
                else  if(status==3){
                    method = Constant.getFailedOrderURL;
                }
            
            ApiManager.sharedInstance.requestGETURL(method+"/"+AppUserDefaults.userId!, success: { (JSON) in
                    let msg =  JSON[0].dictionary?["Message"]
                    if((JSON[0].dictionary?["IsSuccess"]) != false){
                        self.listOrders = ((JSON[0].dictionaryObject!["ResponseData"]) as? [[String:Any]])!;
                        print( self.listOrders as Any)
                    }
                    else{
                        LPSnackbar.showSnack(title: msg!.description)
                    }
                    DispatchQueue.main.async {
                        Helper.stopLoader()
                    }
                    self.tblTodayOrders.reloadData()
                }) { (Error) in
                    LPSnackbar.showSnack(title: Error.localizedDescription)
                    DispatchQueue.main.async {
                        Helper.stopLoader()
                    }
                }
            }
        
        }
    
    public func ChangeDeliveryStatus(dicParam:[String:Any]){
        DispatchQueue.main.async {
            Helper.showLoader()
        }
        ApiManager.sharedInstance.requestPOSTURL(Constant.changeDeliveryStatusURL, params: dicParam, success: { [self](JSON) in
            let msg =  JSON.dictionary?["Message"]?.stringValue
            print(msg as Any)
            if((JSON.dictionary?["IsSuccess"]) != false){
                self.GetOrders(status: 0)
            }
            else{
                LPSnackbar.showSnack(title: msg!)
            }
        },failure: { (Error) in
            DispatchQueue.main.async {
                Helper.stopLoader()
            }
        })
        
    }
    
    public func ShowProducs(productArr:[[String:Any]],vcParent:SwipeOrdersViewController){
        let vc = Constant.StoryBoard.instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        vc.listProducts = productArr;
        vcParent.navigationController?.pushViewController(vc, animated: true)
    }
}

extension OrderListViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOrders.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(Constant.selectedTab==0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayOrderTableViewCell") as! TodayOrderTableViewCell
            cell.SetData(dic: listOrders[indexPath.row], vc: self)
            return cell;
        }
        else if(Constant.selectedTab==1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDoneTableViewCell") as! OrderDoneTableViewCell
            cell.SetData(dic: listOrders[indexPath.row])
            return cell;
        }
        else if(Constant.selectedTab==2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingOrderTableViewCell") as! UpcomingOrderTableViewCell
            cell.SetData(dic: listOrders[indexPath.row])
            return cell;
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingOrderTableViewCell") as! UpcomingOrderTableViewCell
            cell.SetData(dic: listOrders[indexPath.row])
            return cell;
        }
        return UITableViewCell();
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(Constant.selectedTab==0){
            return 280
        }
        else  if(Constant.selectedTab==1){
            return 280
        }
        else  if(Constant.selectedTab==2){
            return 90
        }
        else  if(Constant.selectedTab==3){
            return 90
        }
        return 0;
    }
    
    
}
