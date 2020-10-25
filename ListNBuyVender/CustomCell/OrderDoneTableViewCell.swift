//
//  OrderDoneTableViewCell.swift
//  ListNBuyVender
//
//  Created by Apple on 25/10/20.
//

import Foundation
import UIKit
class OrderDoneTableViewCell: UITableViewCell {
    
    @IBOutlet var lblOrderNo:UILabel!
    @IBOutlet var lblPaymentMode:UILabel!
    @IBOutlet var lblAmount:UILabel!
    @IBOutlet var lblDate:UILabel!
    @IBOutlet var lblPickAdd:UILabel!
    @IBOutlet var lblShipAdd:UILabel!
    override class func awakeFromNib() {
        
    }
    
   public func SetData(dic:[String:Any]){
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
        
    }
}
