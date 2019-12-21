//
//  UIImageViewExtension.swift
//  Indus
//
//  Created by Vinod Vishwakarma on 16/06/16.
//  Copyright © 2016 http://runtime-solutions.com. All rights reserved.
//

import Foundation
import UIKit

public extension UIImageView {

    func circulorImageView(imageView: UIImageView) -> Void {
        
        imageView.layer.cornerRadius = (imageView.frame.size.width)/2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1.6
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func setRandomDownloadImage(_ width: Int, height: Int) {
           if self.image != nil {
               self.alpha = 1
               return
           }
           self.alpha = 0
           let url = URL(string: "http://lorempixel.com/\(width)/\(height)/")!
           let configuration = URLSessionConfiguration.default
           configuration.timeoutIntervalForRequest = 15
           configuration.timeoutIntervalForResource = 15
           configuration.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData
           let session = URLSession(configuration: configuration)
           let task = session.dataTask(with: url) { (data, response, error) in
               if error != nil {
                   return
               }
               
               if let response = response as? HTTPURLResponse {
                   if response.statusCode / 100 != 2 {
                       return
                   }
                   if let data = data, let image = UIImage(data: data) {
                       DispatchQueue.main.async(execute: { () -> Void in
                           self.image = image
                           UIView.animate(withDuration: 0.3, animations: { () -> Void in
                               self.alpha = 1
                           }, completion: { (finished: Bool) -> Void in
                           })
                       })
                   }
               }
           }
           task.resume()
       }
       
       func clipParallaxEffect(_ baseImage: UIImage?, screenSize: CGSize, displayHeight: CGFloat) {
           if let baseImage = baseImage {
               if displayHeight < 0 {
                   return
               }
               let aspect: CGFloat = screenSize.width / screenSize.height
               let imageSize = baseImage.size
               let imageScale: CGFloat = imageSize.height / screenSize.height
               
               let cropWidth: CGFloat = floor(aspect < 1.0 ? imageSize.width * aspect : imageSize.width)
               let cropHeight: CGFloat = floor(displayHeight * imageScale)
               
               let left: CGFloat = (imageSize.width - cropWidth) / 2
               let top: CGFloat = (imageSize.height - cropHeight) / 2
               
               let trimRect : CGRect = CGRect(x: left, y: top, width: cropWidth, height: cropHeight)
               self.image = baseImage.trim(trimRect: trimRect)
               self.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: displayHeight)
           }
       }
    
    
    public func imageFromUrl(urlString: String) {

          let url = URL(string:urlString)
          let task = URLSession.shared.dataTask(with: url!) { data, response, error in
              guard let data = data, error == nil else { return }

              DispatchQueue.main.async() {// execute on main thread
                  self.image = UIImage(data: data)
              }
          }
          task.resume()
           
       }
    
}
