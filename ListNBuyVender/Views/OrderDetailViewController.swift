//
//  OrderDetailViewController.swift
//  ListNBuyVender
//
//  Created by Apple on 26/10/20.
//

import Foundation
import UIKit
import LPSnackbar
class OrderDetailViewController: UIViewController {
    @IBOutlet var tblProducts:UITableView!
    public var listProducts = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Product Detail"
        tblProducts.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.setNavigationBarHidden(true, animated: false)
        //Helper.setNavigationBar(vc: self)
    }
}
extension OrderDetailViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listProducts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailTableViewCell") as! OrderDetailTableViewCell
            cell.SetData(dic: listProducts[indexPath.row])
            return cell;
       
    }
    
}
