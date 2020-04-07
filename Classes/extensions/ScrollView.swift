//
//  ScrollView.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 30/08/18.
//  Copyright © 2018 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import UIKit
import Foundation

public extension UIScrollView {
    
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -self.contentInset.top)
        self.setContentOffset(desiredOffset, animated: true)

//        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
//        self.setContentOffset(desiredOffset, animated: true)
    }
    
    func scrollToBottom(animated: Bool) {
        if self.contentSize.height < self.bounds.size.height { return }
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: animated)
    }
}


