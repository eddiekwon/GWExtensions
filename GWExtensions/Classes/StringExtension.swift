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
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    // 로컬라이징 문자열 (코멘트)
    func localizedWithComment(comment: String) -> String {
        return NSLocalizedString(self, comment:comment)
    }
}
