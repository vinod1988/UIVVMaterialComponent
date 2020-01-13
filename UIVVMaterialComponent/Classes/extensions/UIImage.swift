//
//  UIImage.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 14/01/18.
//  Copyright © 2018 http://www.aigen.tech  Aigen Tech. All rights reserved.
//

import UIKit

public extension UIImage {
    func trim(trimRect :CGRect) -> UIImage {
        if CGRect(origin: CGPoint.zero, size: self.size).contains(trimRect) {
            if let imageRef = self.cgImage?.cropping(to: trimRect) {
                return UIImage(cgImage: imageRef)
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(trimRect.size, true, self.scale)
        self.draw(in: CGRect(x: -trimRect.minX, y: -trimRect.minY, width: self.size.width, height: self.size.height))
        let trimmedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let image = trimmedImage else { return self }
        
        return image
    }
    
    static func localImage(_ name: String, template: Bool = false) -> UIImage {
      var image = UIImage(named: name)!
      if template {
        image = image.withRenderingMode(.alwaysTemplate)
      }
      return image
    }
}

