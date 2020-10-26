//
//  TodayOrderTableViewCell.swift
//  ListNBuyVender
//
//  Created by Apple on 24/10/20.
//

import Foundation
import UIKit
import LPSnackbar
class TodayOrderTableViewCell: UITableViewCell {
    
    @IBOutlet var lblOrderNo:UILabel!
    @IBOutlet var lblPaymentMode:UILabel!
    @IBOutlet var lblAmount:UILabel!
    @IBOutlet var lblDate:UILabel!
    @IBOutlet var lblPickAdd:UILabel!
    @IBOutlet var lblShipAdd:UILabel!
    @IBOutlet var btnStatus:UIButton!
    @IBOutlet var btnCall:UIButton!
    @IBOutlet var btnProducts:UIButton!
    @IBOutlet var btnPickAdd:UIButton!
    @IBOutlet var btnShipAdd:UIButton!
    public var _vc:OrderListViewController?=nil;
    var _dic:[String:Any]? = nil;
    override class func awakeFromNib() {
        
    }
    
    public func SetData(dic:[String:Any],vc:OrderListViewController){
        _vc=vc;
        _dic=dic;
        if let OrderNo = dic["orderNo"]{
            lblOrderNo.text = OrderNo as? String
        }
        
        if let pay_method = dic["pay_method"]{
            lblPaymentMode.text = pay_method as? String
        }
        
        if let amount = dic["total"]{
            lblAmount.text = amount as? String
        }
        
        if let placed_dt = dic["placed_dt"]{
            lblDate.text = placed_dt as? String
        }
        
        if let warehouseAddress = dic["warehouseAddress"]{
            lblPickAdd.text = warehouseAddress as? String
        }
        
        if let shipping_address = dic["shipping_address"]{
            lblShipAdd.text = shipping_address as? String
        }
        
        if let app_status = dic["app_status"]{
            btnStatus.setTitle(app_status as! String,for: UIControl.State.normal)
        }
    }
    
    @IBAction func btnOrderStatus_Click(sender:UIButton){
        let dicParm :[String:Any] = ["delivery_status": (_dic!["delivery_status"] as! String), "orderId": (_dic!["id"] as! String),"app_status": (_dic!["app_status"] as! String),"deliveryboyId": AppUserDefaults.userId as Any]
        if KAPPDELEGATE.isInternetAvailable(){
            _vc?.ChangeDeliveryStatus(dicParam: dicParm);
        }else{
            LPSnackbar.showSnack(title: AlertMsg.warningToConnectNetwork)
        }
    }
    
    @IBAction func btnProductS_Click(sender:UIButton){
        _vc?.ShowProducs(productArr: _dic!["products"] as! [[String : Any]], vcParent: Constant.swipeController!)
    }
}
