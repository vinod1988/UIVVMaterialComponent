//
//  UIButtonExtension.swift
//  OnlyOnRent
//
//  Created by Vinod Vishwakarma on 18/10/15.
//  Copyright © 2015 Vinod Vishwakarma. All rights reserved.
//

import UIKit

extension  UIButton {
    
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
