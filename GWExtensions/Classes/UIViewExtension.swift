//
//  UIViewExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 4. 18..
//
//

import UIKit

public extension UIView {
    
    public class func copyView() -> AnyObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
    
    public func nextViewOriginY() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    public func nextViewOriginX() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    // Set imageview square
    public func setSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    // All subview remove
    public func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    // Screen capture of the view
    public func capture(_ shadow: Bool = false) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let snapshotImageView = UIImageView(image: image)
        if shadow {
            snapshotImageView.layer.masksToBounds = false
            snapshotImageView.layer.cornerRadius = 0.0
            snapshotImageView.layer.shadowOffset = CGSize(width: -0.5, height: 0.0)
            snapshotImageView.layer.shadowRadius = 5.0
            snapshotImageView.layer.shadowOpacity = 0.4
        }
        // return image 면 UIImage, return snapshotImageView 면 UIImageView
        return image!
    }
}

public extension UIWebView {
    
    // Screen capture of the Webview
    public func capture() -> UIImage { UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.isOpaque, 0)
        let currentContentOffset = scrollView.contentOffset
        let currentFrame = scrollView.frame
        scrollView.contentOffset = CGPoint.zero
        scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.contentSize.width, height: scrollView.contentSize.height)
        scrollView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        scrollView.contentOffset = currentContentOffset
        scrollView.frame = currentFrame
        UIGraphicsEndImageContext()
        return image
    }
}

public extension UITableView {
    
    // TableviewCell all select
    public func setAsSelectAll(section: Int) {
        for row in 0 ..< self.numberOfRows(inSection: section) {
            self.selectRow(at: IndexPath(row: row, section: section), animated: false, scrollPosition: .none)
        }
    }
    
    // TableviewCell all deselect
    public func setAsDeselectAll(section: Int) {
        for row in 0 ..< self.numberOfRows(inSection: section) {
            self.deselectRow(at: IndexPath(row: row, section: section), animated: false)
        }
    }
}
