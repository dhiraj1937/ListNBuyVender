//
//  UpcomingOrderTableViewCell.swift
//  ListNBuyVender
//
//  Created by Apple on 26/10/20.
//

import Foundation
import UIKit
class UpcomingOrderTableViewCell: UITableViewCell {
    
    @IBOutlet var lblOrderNo:UILabel!
    @IBOutlet var lblPaymentMode:UILabel!
    @IBOutlet var lblAmount:UILabel!
    @IBOutlet var lblDate:UILabel!
    
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
        
    }
}
