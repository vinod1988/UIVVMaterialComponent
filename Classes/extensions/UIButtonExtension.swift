//
//  UIButtonExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 18/10/15.
//  Copyright © 2015 Appinventor Inc http://appinventor.co.in.. All rights reserved.
//

import UIKit

public extension  UIButton {
    
    /// Makes the ``imageView`` appear just to the right of the ``titleLabel``.
    func alignImageRight() {
        if let titleLabel = self.titleLabel, let imageView = self.imageView {
            // Force the label and image to resize.
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            imageView.contentMode = .scaleAspectFit
            
            // Set the insets so that the title appears to the left and the image appears to the right.
            // Make the image appear slightly off the top/bottom edges of the button.
            let leftTextMargin:CGFloat = 4
            
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left:( -1 * (imageView.frame.size.width - leftTextMargin)),
                bottom: 0, right: imageView.frame.size.width)
            
            self.imageEdgeInsets = UIEdgeInsets(top: 4, left: self.frame.size.width - 30,
                bottom: 4, right: -1 * titleLabel.frame.size.width)
        }
    }
    
    func alignImageLeft() {
        if let titleLabel = self.titleLabel, let imageView = self.imageView {
            // Force the label and image to resize.
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            imageView.contentMode = .scaleAspectFit
            
            // Set the insets so that the title appears to the left and the image appears to the right.
            // Make the image appear slightly off the top/bottom edges of the button.
            let leftTextMargin:CGFloat = 4
            
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left:imageView.frame.size.width,
                bottom: 0, right: ( -1 * (imageView.frame.size.width - leftTextMargin)))
            
            self.imageEdgeInsets = UIEdgeInsets(top: 4, left: -1 * titleLabel.frame.size.width,
                bottom: 4, right:self.frame.size.width - 30 )
        }
    }
    
    func underline() {
           guard let text = self.titleLabel?.text else { return }
           let attributedString = NSMutableAttributedString(string: text)
           //NSAttributedStringKey.foregroundColor : UIColor.blue
           attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
           attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
           attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
           self.setAttributedTitle(attributedString, for: .normal)
    }
    
    
   
}

extension CGRect{
    init(_ x:CGFloat,_ y:CGFloat,_ width:CGFloat,_ height:CGFloat) {
        self.init(x:x,y:y,width:width,height:height)
    }
    
}
extension CGSize{
    init(_ width:CGFloat,_ height:CGFloat) {
        self.init(width:width,height:height)
    }
}
extension CGPoint{
    init(_ x:CGFloat,_ y:CGFloat) {
        self.init(x:x,y:y)
    }
}
