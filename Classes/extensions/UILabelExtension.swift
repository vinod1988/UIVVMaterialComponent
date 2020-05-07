//
//  UILabelExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 04/02/17.
//  Copyright © 2017 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import UIKit

public extension UILabel {

     func paddingLabel(rect: CGRect) {
//        let newRect = CGRect.offsetBy(rect, 20, 0) // move text 10 points to the right
//        let newRect = CGRect.offsetBy(rect)
//        self.drawText(in: newRect)
//        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        self.drawText(in: rect.inset(by: UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)))
    }
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

           guard let labelText = self.text else { return }

           let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = lineSpacing
           paragraphStyle.lineHeightMultiple = lineHeightMultiple

           let attributedString:NSMutableAttributedString
           if let labelattributedText = self.attributedText {
               attributedString = NSMutableAttributedString(attributedString: labelattributedText)
           } else {
               attributedString = NSMutableAttributedString(string: labelText)
           }

           // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

           self.attributedText = attributedString
       }
    
    //This will return a attributed String so set attributed text on /UILabel
    func justifyText(text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.justified
        let attributedString = NSAttributedString(string: text,
                                                  attributes: [
                                                    NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                    NSAttributedString.Key.baselineOffset: NSNumber(value: 0)
            ])

        return attributedString
    }
    
    
    // Left side image with text
    func setLeftImgWithText(image: UIImage, width:CGFloat, height:CGFloat, with text: String) {
      let attachment = NSTextAttachment()
      attachment.image = image
      attachment.bounds = CGRect(x: 0, y: 0, width: width, height: height)
      let attachmentStr = NSAttributedString(attachment: attachment)

      let mutableAttributedString = NSMutableAttributedString()
      mutableAttributedString.append(attachmentStr)

        let textString = NSAttributedString(string: text)
      mutableAttributedString.append(textString)

      self.attributedText = mutableAttributedString
    
    }
    
    func setRightImgWithText(image: UIImage, width:CGFloat, height:CGFloat, with text: String) {
      let attachment = NSTextAttachment()
      attachment.image = image
      attachment.bounds = CGRect(x: 0, y: 0, width: width, height: height)
      let attachmentStr = NSAttributedString(attachment: attachment)

      let mutableAttributedString = NSMutableAttributedString()

        let textString = NSAttributedString(string: text)
      mutableAttributedString.append(textString)
      mutableAttributedString.append(attachmentStr)

      self.attributedText = mutableAttributedString
    
    }
    
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
    
    
}
