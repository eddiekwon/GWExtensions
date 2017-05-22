//
//  UIViewExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 4. 18..
//
//

import UIKit

public extension UIView
{
    public class func copyView() -> AnyObject {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
    }
    
    public func nextViewOriginY() -> CGFloat {
        return self.frame.origin.y + self.frame.size.height
    }
    
    public func nextViewOriginX() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }
    
    // 원형 프레임 잡아주기
    public func setSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
    
    // 모든 서브뷰 삭제
    public func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    // 현재 뷰에 대한 화면 캡쳐
    func capture(_ shadow: Bool = false) -> UIImage {
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

extension UIWebView {
    
    // 현재 웹뷰의 화면을 캡쳐
    func capture() -> UIImage { UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, scrollView.isOpaque, 0)
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

extension UITableView {
    
    func setAsSelectAll(section: Int) {
        for row in 0 ..< self.numberOfRows(inSection: section) {
            self.selectRow(at: IndexPath(row: row, section: section), animated: false, scrollPosition: .none)
        }
    }
    
    func setAsDeselectAll(section: Int) {
        for row in 0 ..< self.numberOfRows(inSection: section) {
            self.deselectRow(at: IndexPath(row: row, section: section), animated: false)
        }
    }
}

extension CGFloat {
    
    // Auto Width ( Standard = 4.7" )
    func setAutoWidth(_ width: Int) -> CGFloat {
        switch UIScreen.main.bounds.width {
        case 320:   // 3.5", 4"
            return CGFloat(Float((width/375) * 320))
        case 375:   // 4.7"
            return CGFloat(Float((width/375) * 375))
        case 414:   // 5.5"
            return CGFloat(Float((width/375) * 414))
        default:
            return 0
        }
    }
    
    // Auto Height ( Standard = 4.7" )
    func setAutoHeight(_ height: Int) -> CGFloat {
        switch UIScreen.main.bounds.width {
        case 480:   // 3.5"
            return CGFloat(Float((height/667) * 480))
        case 568:   // 4"
            return CGFloat(Float((height/667) * 568))
        case 667:   // 4.7"
            return CGFloat(Float((height/667) * 667))
        case 736:   // 5.5"
            return CGFloat(Float((height/667) * 736))
        default:
            return 0
        }
    }
}
