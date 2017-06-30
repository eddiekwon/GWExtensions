//
//  AttributeStringExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 6. 30..
//
//

import UIKit

public extension NSMutableAttributedString {
    
    // AttributeString simplification
    public func setAttribute(font: UIFont, color: UIColor, start: Int, length: Int) {
        self.addAttributes([NSFontAttributeName: font, NSForegroundColorAttributeName: color],
                           range: NSMakeRange(start, length))
    }
}
