//
//  CALayerExtension.swift
//  SYPX
//
//  Created by Vinod Vishwakarma on 19/10/19.
//  Copyright © 2019 http://www.aigen.tech  Aigen Tech. All rights reserved.
//

import UIKit

public extension CALayer {
  func addShadow(color: UIColor, offset: CGSize, radius: CGFloat) {
    shadowColor = color.cgColor
    shadowOffset =  offset
    shadowRadius = radius
    shadowOpacity = 1
  }
  
  func addBottomBorder(color: UIColor = .separator, width: CGFloat = 1) {
    let borderLayer = CALayer()
    borderLayer.frame = CGRect(
      x: 0,
      y: frame.height - 1,
      width: frame.width,
      height: width)
    borderLayer.backgroundColor = color.cgColor
    addSublayer(borderLayer)
  }
}

