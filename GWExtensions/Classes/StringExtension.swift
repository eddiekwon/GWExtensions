//
//  StringExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 4. 18..
//
//

import UIKit

public extension String {
    
    // String Trim
    public var stringTrim: String{
       return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // String length
    public var length: Int {
        return self.characters.count
    }
    
    // String reversed
    public func reversed() -> String {
        return self.characters.reversed().map { String($0) }.joined(separator: "")
    }
    
    // String localized
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    // String localized with comment
    public func localizedWithComment(comment: String) -> String {
        return NSLocalizedString(self, comment:comment)
    }
    
    // E-mail address validation
    public func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    // Password validation
    public func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
    // String split return array
    public func arrayBySplit(splitter: String? = nil) -> [String] {
        if let s = splitter {
            return self.components(separatedBy: s)
        } else {
            return self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        }
    }
}
