//
//  AvailabilityCell.swift
//  ListNBuyVender
//
//  Created by Rajesh Jayaswal on 26/10/20.
//

import UIKit

class AvailabilityCell: UITableViewCell {

    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblAvailableTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func formateDateAvailable(strDate:String) -> String {
         let dateformatter = DateFormatter()
         dateformatter.dateFormat = "yyyy-MM-dd"
        guard let strCorrect = dateformatter.date(from: strDate) else {return strDate}
        dateformatter.dateFormat = "dd-MM-yyyy"
        return dateformatter.string(from: strCorrect)
    }
    public func SetData(dic:[String:Any]){
         if let date = dic["Date"]{
            lblDate.text = formateDateAvailable(strDate: date as! String)
         }
         lblAvailableTime.text = "Available Time: 10 AM to 7 PM"
     }
}
