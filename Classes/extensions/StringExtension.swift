//
//  StringExtension.swift
//  UIVVMaterialComponent
//
//  Created by Vinod Vishwakarma on 27/11/15.
//  Copyright © 2015 Appinventor Inc http://appinventor.co.in. All rights reserved.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

public extension String {
    
    
    
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    
    
    var length: Int {
        return self.count
    }
    
    func getPathExtension() -> String {
        return (self as NSString).pathExtension
    }
    
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == 10
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
    
    func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    //MARK:- UITextField Related method
    
    // Text and space only.
    func containsAlphabet(string: String) -> Bool {
        if string == " " { return true }
        if let _ = string.rangeOfCharacter(from: CharacterSet.letters){
            return true
        }
        return false
    }
    
    // Text and space only.
    func containsNumber(string: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: "0123456789")
        return string.rangeOfCharacter(from: characterSet) != nil
    }
    
    // Returns true if the string has at least one character in common with matchCharacters.
    func containsCharactersIn(matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) != nil
    }
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = CharacterSet(charactersIn: matchCharacters).inverted
        return self.rangeOfCharacter(from: disallowedCharacterSet) == nil
    }
    
    // Returns true if the string has no characters in common with matchCharacters.
    func doesNotContainCharactersIn(matchCharacters: String) -> Bool {
        let characterSet = CharacterSet(charactersIn: matchCharacters)
        return self.rangeOfCharacter(from: characterSet) == nil
    }
    
    // Returns true if the string represents a proper numeric value.
    // This method uses the device's current locale setting to determine
    // which decimal separator it will accept.
    func isNumeric() -> Bool{
        let scanner = Scanner(string: self)
        
        // A newly-created scanner has no locale by default.
        // We'll set our scanner's locale to the user's locale
        // so that it recognizes the decimal separator that
        // the user expects (for example, in North America,
        // "." is the decimal separator, while in many parts
        // of Europe, "," is used).
        scanner.locale = NSLocale.current
        
        return scanner.scanDecimal(nil) && scanner.isAtEnd
    }
    
    
    private func MD5(string: String) -> Data {
        
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    func md5(data:String) -> String {
        let md5Data = MD5(string:data)
        let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
    
    func md5Base64(data:String) -> String {
        let md5Data = MD5(string:data)
        let md5Base64 = md5Data.base64EncodedString()
        return md5Base64
    }
    
    /*
     Use this function to make the text as sentance.
     
     */
    func sentanceWords() -> String {
        if self.count > 0 {
            return self.prefix(1).capitalized + dropFirst()
            
        } else {
            return self
        }
    }
    
    /*
      To check the new line and empty space in string.
    
    */
    var isBlank : Bool {
        let s = self
        let cset = NSCharacterSet.newlines.inverted
        let r = s.rangeOfCharacter(from:cset)
        let ok = s.isEmpty || r == nil
        return ok
    }
    
    
    /**
     Then, whenever you want to put HTML text in a UITextView use:
     textView.attributedText = htmlText.htmlToAttributedString
     */
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    var isInteger: Bool { return Int(self) != nil }
    var isFloat: Bool { return Float(self) != nil }
    var isDouble: Bool { return Double(self) != nil }
    
}
