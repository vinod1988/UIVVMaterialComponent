//
//  DoubleExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod VIshwakarma on 01/08/2020.
//  Copyright © 2020 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func roundToPlaces(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

