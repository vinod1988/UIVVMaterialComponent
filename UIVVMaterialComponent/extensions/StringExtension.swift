//
//  StringExtension.swift
//  OnlyOnRent
//
//  Created by Vinod Vishwakarma on 27/11/15.
//  Copyright © 2015 Vinod Vishwakarma. All rights reserved.
//

import Foundation

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
    
    
}
