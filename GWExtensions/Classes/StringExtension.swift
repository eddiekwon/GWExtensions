//
//  StringExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 4. 18..
//
//

import UIKit

public extension String {
    
    // 문자열 공백 삭제
    public var stringTrim: String{
       return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // 문자열 길이
    public var length: Int {
        return self.characters.count
    }
    
    // 문자열 반전
    public func reversed() -> String {
        return self.characters.reversed().map { String($0) }.joined(separator: "")
    }
    
    // 로컬라이징 문자열
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    // 로컬라이징 문자열 (코멘트)
    public func localizedWithComment(comment: String) -> String {
        return NSLocalizedString(self, comment:comment)
    }
    
    // 이메일 정규식
    public func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    // 비밀번호 정규식
    public func validatePassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,16}$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: self)
    }
    
    // 문자열 분해
    public func arrayBySplit(splitter: String? = nil) -> [String] {
        if let s = splitter {
            return self.components(separatedBy: s)
        } else {
            return self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        }
    }
}
