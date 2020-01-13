//
//  NSStringExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 27/11/15.
//  Copyright © 2015 Vinod Vishwakarma. All rights reserved.
//

import Foundation

public extension NSString {

    
     func trim() -> NSString {
        
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) as NSString
    }
    
    func percentEncoding() -> NSString {
        
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)! as NSString
    }
    
    
}
