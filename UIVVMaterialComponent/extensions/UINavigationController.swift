//
//  UINavigationController.swift
//  SYPX
//
//  Created by Vinod VIshwakarma on 20/11/2019.
//  Copyright © 2019 http://www.aigen.tech  Aigen Tech. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension UINavigationController {
    
    /**
     It removes all view controllers from navigation controller then set the new root view controller and it pops.
     
     - parameter vc: root view controller to set a new
     */
    func initRootViewController(vc: UIViewController, transitionType type:CATransitionType) {
        let duration: CFTimeInterval = 0.3
        self.addTransition(transitionType: type, duration: duration)
        self.viewControllers.removeAll()
        self.pushViewController(vc, animated: false)
        self.popToRootViewController(animated: false)
    }
    
    /**
     It adds the animation of navigation flow.
     
     - parameter type: kCATransitionType, it means style of animation
     - parameter duration: CFTimeInterval, duration of animation
     */
    private func addTransition(transitionType type:CATransitionType, duration: CFTimeInterval = 0.3) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type =  type
        self.view.layer.add(transition, forKey: nil)
    }
}
