//
//  UIDeviceExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 4. 18..
//
//

import UIKit

public extension UIDevice {
    
    // Get device UUID
    public class func getUuid() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
    // Get device system name
    public class func getDeviceSystemName() -> String {
        return UIDevice.current.systemName
    }
    
    // Get device system version
    public class func getDeviceSystemVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    // Get device name
    public class func getDeviceName() -> String {
        return UIDevice.current.name
    }
    
    // Get device language
    public class func getDeviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }
    
    // Get device kinds (i phone)
    public class func isiPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Get device kinds (i pad)
    public class func isiPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
}


