//
//  UIViewControllerExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 06/06/16.
//  Copyright © 2016 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    
    //    func setNavigationBarItem() {
    //        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu")!)
    //        self.slideMenuController()?.removeLeftGestures()
    //        self.slideMenuController()?.addLeftGestures()
    //    }
    //
    //    func removeNavigationBarItem() {
    //        self.navigationItem.leftBarButtonItem = nil
    //        self.navigationItem.rightBarButtonItem = nil
    //        self.slideMenuController()?.removeLeftGestures()
    //    }
    
    override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK:- Touch any side hide the keyboard
    func dismissKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissActiveKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissActiveKeyboard() {
        view.endEditing(true)
    }
    
    //MARK:- On keyboard open screen up and down Notification
    
    @objc func keyboardWillShow(notification: NSNotification, active_view: UIView) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        
        let active_view = self.view//AppUtility.shared().active_view
        if let frame = active_view?.superview?.convert(active_view?.frame ?? CGRect(), to: nil) {
            let frame_y_loc = frame.origin.y
            //            print("frame_y_loc = \(frame_y_loc)")
            //            print("view.frame.height = \(self.view.frame.height)")
            //            print("keyboardframe.height = \(keyboardFrame.height)")
            //            print("view.frame.height - keyboardFrame.height = \(self.view.frame.height - keyboardFrame.height)")
            if frame_y_loc > (self.view.frame.height - (keyboardFrame.height + 30)){
                //                self.view.frame.origin.y -= keyboardFrame.height
                self.view.frame.origin.y -= (frame_y_loc-(self.view.frame.height - keyboardFrame.height - 50))
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y = 0
        }
    }
    
    
    // Screen width.
    var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    // Screen height.
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    //MARK:- Generate  QR CODE
    
    func generateQR(_ str: String, size: CGSize) -> UIImage {
        let stringData = str.data(using: .utf8)
        
        let qrFilter = CIFilter(name: "CIQRCodeGenerator")!
        qrFilter.setValue(stringData, forKey: "inputMessage")
        qrFilter.setValue("H", forKey: "inputCorrectionLevel")
        
        let minimalQRimage = qrFilter.outputImage!
        // NOTE that a QR code is always square, so minimalQRimage..width === .height
        let minimalSideLength = minimalQRimage.extent.width
        
        let smallestOutputExtent = (size.width < size.height) ? size.width : size.height
        let scaleFactor = smallestOutputExtent / minimalSideLength
        let scaledImage = minimalQRimage.transformed(
            by: CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        
        let qrImage = UIImage(ciImage: scaledImage,
        scale: UIScreen.main.scale,
        orientation: .up)
        
        return self.convert(qrImage.ciImage!)
        
    }

    
    
     func validateEmail(email: String) -> Bool {
           let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
           return emailPredicate.evaluate(with: email)
       }
       
       func validateForm(text_fields: [UITextField])-> Bool {
           var is_valid: Bool = true
           for iter in 0..<text_fields.count {
               let text_field = text_fields[iter]
               
               // Check if text field is empty
               if text_field.text!.isEmpty {
                   text_field.layer.cornerRadius = 5
                   text_field.layer.borderWidth = 1.0
                   text_field.layer.borderColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
                   is_valid = false
               }
               
               // Check if text field is an email address and is valid
               if text_field.textContentType == UITextContentType.emailAddress {
                   print(self.validateEmail(email: text_field.text!.trim()))
                   if !self.validateEmail(email: text_field.text!.trim()) {
                       text_field.layer.borderWidth = 1.0
                       text_field.layer.borderColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor
                       is_valid = false
                   }
               }
           }
           
           return is_valid
       }
       
    
    
    func convert(_ cmage:CIImage) -> UIImage {
        let context:CIContext = CIContext.init(options: nil)
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image:UIImage = UIImage.init(cgImage: cgImage)
        return image
    }
    
    
    func timestampToDate(timestamp: CLong)-> String {
          let date = NSDate(timeIntervalSince1970: TimeInterval(timestamp))
          
          let dayTimePeriodFormatter = DateFormatter()
          dayTimePeriodFormatter.dateFormat = "hh:mm a dd/MM/YYYY"
          
          let dateString = dayTimePeriodFormatter.string(from: date as Date)
          
          return dateString
      }
      
    
    //MARK:- Make UIAlertController compatible for iPad as well
    func addActionSheetForiPad(actionSheet: UIAlertController) {
      if let popoverPresentationController = actionSheet.popoverPresentationController {
        popoverPresentationController.sourceView = self.view
        popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        popoverPresentationController.permittedArrowDirections = []
      }
    }
    
    //MARK:- To get the storyboard id based on class name as storyboard id
    class var storyboardID : String {
      return "\(self)"
    }
    
    
    
}
