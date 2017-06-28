//
//  UIColorExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 4. 18..
//
//

import UIKit

public extension UIColor {
    // View 색상을 한가지로 통일
    public func setOneColor(_ colorRGB: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: colorRGB/255.0, green: colorRGB/255.0, blue: colorRGB/255.0, alpha: alpha)
    }
    
    // Color Hex값으로 설정
    public convenience init?(hexString: String, alpha: CGFloat) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = alpha
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
