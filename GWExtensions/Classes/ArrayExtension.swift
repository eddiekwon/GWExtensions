//
//  ArrayExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 7. 24..
//
//

import UIKit

public extension Array {
    
    // Array to random item
    public var randomArrayItem: Any {
        let ramdomIndex = Int(arc4random_uniform(UInt32(self.count)))
        return self[ramdomIndex]
    }
}
