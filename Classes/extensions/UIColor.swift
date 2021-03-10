//
//  UIColor.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 27/11/15.
//  Copyright © 2015 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {

    
   
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }
    
    convenience init(hex: String, alpha: CGFloat) {
       let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
         let scanner = Scanner(string: hexString)
         
         if (hexString.hasPrefix("#")) {
           scanner.scanLocation = 1
         }
         
         var color: UInt64 = 0
         scanner.scanHexInt64(&color)
         
         let mask = 0x000000FF
         let r = Int(color >> 16) & mask
         let g = Int(color >> 8) & mask
         let b = Int(color) & mask
         
         let red   = CGFloat(r) / 255.0
         let green = CGFloat(g) / 255.0
         let blue  = CGFloat(b) / 255.0
         
         self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    
    // custom color methods
    class func colorWithHex(rgbValue: UInt64) -> UIColor {
        return UIColor( red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                        alpha: CGFloat(1.0))
    }
    
    func hexCode(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    class func colorWithHexString(hexStr: String) -> UIColor {
        var cString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexStr.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if (cString.isEmpty || (cString.count) != 6) {
            return colorWithHex(rgbValue: 0xFF5300);
        } else {
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            
            return colorWithHex(rgbValue: rgbValue);
        }
    }
    
    
    class func colorWithHexAlpha(rgbValue: UInt64, alpha:CGFloat) -> UIColor {
        return UIColor( red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                        alpha: alpha)
    }

    class func colorHexString(hexStr: String, alpha:CGFloat) -> UIColor {
        var cString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (hexStr.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if (cString.isEmpty || (cString.count) != 6) {
            return colorWithHexAlpha(rgbValue: 0xFF5300, alpha: alpha);
        } else {
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            
            return colorWithHexAlpha(rgbValue: rgbValue, alpha: alpha);
        }
    }
    
    static var randomColor: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
    
    class func changeImageColor(theImageView: UIImageView, newColor: UIColor) {
        theImageView.image = theImageView.image?.withRenderingMode(.alwaysOriginal)
        theImageView.tintColor = newColor;
    }
    
}


extension String {
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
}


extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
