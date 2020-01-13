//
//  TextView.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 28/10/18.
//  Copyright © 2018 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import UIKit

public extension UITextView {
   
    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    func addBottomBorder() {
        let border = CALayer()
        border.backgroundColor = UIColor.black.cgColor
        border.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}


