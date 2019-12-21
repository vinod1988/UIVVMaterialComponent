//
//  UIApplication.swift
//  SYPX
//
//  Created by Vinod VIshwakarma on 20/11/2019.
//  Copyright © 2019 http://www.aigen.tech  Aigen Tech. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    static var loginAnimation: UIView.AnimationOptions = .transitionFlipFromRight
    static var logoutAnimation: UIView.AnimationOptions = .transitionCrossDissolve
    

        static func setRootView(_ viewController: UIViewController,
                                   options: UIView.AnimationOptions = .transitionFlipFromRight,
                                   animated: Bool = true,
                                   duration: TimeInterval = 0.5,
                                   completion: (() -> Void)? = nil) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        guard animated else {
            window!.rootViewController = viewController
            return
        }
        

        UIView.transition(with:window!, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            window?.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }) { _ in
            completion?()
        }
    }
    
}
