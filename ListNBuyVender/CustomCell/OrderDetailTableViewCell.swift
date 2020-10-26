//
//  OrderDetailTableViewCell.swift
//  ListNBuyVender
//
//  Created by Apple on 26/10/20.
//

import Foundation
import UIKit
import LPSnackbar
class OrderDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var imgProduct:UIImageView!
    @IBOutlet var lblProductID:UILabel!
    @IBOutlet var lblProduct:UILabel!
    @IBOutlet var lblSKU:UILabel!
    @IBOutlet var lblHSN:UILabel!
    @IBOutlet var lblQty:UILabel!
    override class func awakeFromNib() {
        
    }
    
    public func SetData(dic:[String:Any]){
        if let product_id = dic["product_id"]{
            lblProductID.text = product_id as? String
        }

        if let name = dic["name"]{
            lblProduct.text = name as? String
        }

        if let SKU = dic["SKU"]{
            lblSKU.text = SKU as? String
        }

        if let HSNCode = dic["HSNCode"]{
            lblHSN.text = HSNCode as? String
        }

        if let quantity = dic["quantity"]{
            lblQty.text = quantity as? String
        }

        if let image = dic["image"]{
            imgProduct.downloaded(from:URL.init(string: image as! String)!)
        }

    }
    
}
