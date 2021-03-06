//
//  UINavigationBarExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 15/06/16.
//  Copyright © 2016 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationBar {
    
    class func hideNavigationLine() -> Void {
        
        UINavigationBar.appearance().setBackgroundImage(
            UIImage(),
            for: .any,
            barMetrics: .default)
        
        UINavigationBar.appearance().shadowImage = UIImage()
        
    }
    
    func shouldRemoveShadow(_ value: Bool) -> Void {
        if value {
            self.setValue(true, forKey: "hidesShadow")
        } else {
            self.setValue(false, forKey: "hidesShadow")
        }
    }
    
    class func navigationColor(navController: UINavigationController) -> Void {
        
        navController.navigationBar.barTintColor = UIColor.init(red: 11/255, green: 53/255, blue: 110/255, alpha: 1)
        UINavigationBar.hideNavigationLine()
        
    }
    
    
    func hideBottomHairline() -> Void {
        let navigationBarImageView = hairlineImageViewInNavigationBar(view: self)
        navigationBarImageView!.isHidden = true
    }
    
    func showBottomHairline() -> Void {
        let navigationBarImageView = hairlineImageViewInNavigationBar(view: self)
        navigationBarImageView!.isHidden = false
    }
    
    private func hairlineImageViewInNavigationBar(view: UIView) -> UIImageView? {
        if view.isKind(of:UIImageView.self) && view.bounds.height <= 1.0 {
            return (view as! UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInNavigationBar(view: subview) {
                return imageView
            }
        }
        
        return nil
    }
    
    
    
}

public extension UINavigationItem {
    
    func setTitle(_ title: String, subtitle: String) {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 17.0)
        titleLabel.textColor = .black
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = subtitle
        subtitleLabel.font = .systemFont(ofSize: 12.0)
        subtitleLabel.textColor = .gray
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical
        
        self.titleView = stackView
    }
}


