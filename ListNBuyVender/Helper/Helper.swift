//
//  Helper.swift
//  ListNBuyVender
//
//  Created by Apple on 21/10/20.
//

import Foundation
import UIKit
import SVProgressHUD

public class Helper {
    
    //MARK:- Show loader
       class func showLoader() {
           SVProgressHUD.setDefaultStyle(.custom)
           SVProgressHUD.setDefaultMaskType(.custom)
           SVProgressHUD.setForegroundColor(UIColor.red)           //Ring Color
           SVProgressHUD.show(withStatus: "Please wait...")
       }
       
       class func stopLoader() {
           SVProgressHUD.dismiss()
       }
    
}

@IBDesignable
open class VariableCornerRadiusView: UIView  {

    private func applyRadiusMaskFor() {
        let path = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
        
    }

    @IBInspectable
    open var topLeftRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    @IBInspectable
    open var topRightRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    @IBInspectable
    open var bottomLeftRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    @IBInspectable
    open var bottomRightRadius: CGFloat = 0 {
        didSet { setNeedsLayout() }
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        applyRadiusMaskFor()
    }
    
    
    @IBInspectable var addShadow:Bool = true{

            didSet(newValue) {
                if(newValue == true){
                    //self.layer.masksToBounds = true
//                    self.layer.shadowColor = UIColor.gray.cgColor
//                    self.layer.shadowOpacity = 1
//                    self.layer.shadowOffset = CGSize(width: 2, height: 3)
//                    self.layer.shadowRadius = 3
//
//                    self.layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//                    self.layer.shouldRasterize = true
//                    self.layer.rasterizationScale =  UIScreen.main.scale
//                    print("trying to use shadow")
                }
            }

        }
}



extension UIBezierPath {

    convenience init(shouldRoundRect rect: CGRect, topLeftRadius: CGFloat, topRightRadius: CGFloat, bottomLeftRadius: CGFloat, bottomRightRadius: CGFloat){

        self.init()

        let path = CGMutablePath()

        let topLeft = rect.origin
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)

        if topLeftRadius != 0 {
            path.move(to: CGPoint(x: topLeft.x + topLeftRadius, y: topLeft.y))
        } else {
            path.move(to: topLeft)
        }

        if topRightRadius != 0 {
            path.addLine(to: CGPoint(x: topRight.x - topRightRadius, y: topRight.y))
            path.addArc(tangent1End: topRight, tangent2End: CGPoint(x: topRight.x, y: topRight.y + topRightRadius), radius: topRightRadius)
        }
        else {
            path.addLine(to: topRight)
        }

        if bottomRightRadius != 0 {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - bottomRightRadius))
            path.addArc(tangent1End: bottomRight, tangent2End: CGPoint(x: bottomRight.x - bottomRightRadius, y: bottomRight.y), radius: bottomRightRadius)
        }
        else {
            path.addLine(to: bottomRight)
        }

        if bottomLeftRadius != 0 {
            path.addLine(to: CGPoint(x: bottomLeft.x + bottomLeftRadius, y: bottomLeft.y))
            path.addArc(tangent1End: bottomLeft, tangent2End: CGPoint(x: bottomLeft.x, y: bottomLeft.y - bottomLeftRadius), radius: bottomLeftRadius)
        }
        else {
            path.addLine(to: bottomLeft)
        }

        if topLeftRadius != 0 {
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + topLeftRadius))
            path.addArc(tangent1End: topLeft, tangent2End: CGPoint(x: topLeft.x + topLeftRadius, y: topLeft.y), radius: topLeftRadius)
        }
        else {
            path.addLine(to: topLeft)
        }

        path.closeSubpath()
        cgPath = path
    }
    
    
   
}

extension UIViewController : UITextFieldDelegate,UITextViewDelegate{
    
    @IBAction func btnBack_Click(){
        self.navigationController?.popViewController(animated: true);
    }
    
    
    public func SetStatusBarColor(color:UIColor=UIColor.init(red: 249/255, green: 178/255, blue: 18/255, alpha: 1)){
        //UIApplication.shared.statusBarUIView?.backgroundColor = color
    }
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //Constant.txtglobal = textField;
        return true;
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true;
    }
}


class RJBorderedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 21
        self.clipsToBounds = true
    }
}


class RJBorderedTF: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
       self.layer.cornerRadius = 21
       self.dropShadow(scale: true)
       // self.layer.borderWidth = 0.5
       // self.clipsToBounds = true
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10 , bottom: 0, right: 40)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


class RJShadowView:UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dropShadow(scale: true)
        self.layer.cornerRadius = 15
    }
}
//MARK:UIView Extension
extension UIView {
func dropShadow(scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowOpacity = 0.5
      layer.shadowOffset = CGSize(width: 2, height: 2)
      layer.shadowRadius = 4
  }
}


extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

