//
//  UITextViewExtension.swift
//  Pods
//
//  Created by Ryu on 2017. 7. 4..
//
//

import UIKit

public extension UITextView {
    
    public func setKeyboardCloseView() {
        let keyboardCloseView = UIView()
        keyboardCloseView.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 30)
        keyboardCloseView.backgroundColor = UIColor(hexString: "#969696", alpha: 1)
        let closeBtn = UIButton(frame: CGRect(x: keyboardCloseView.frame.width - 77, y: keyboardCloseView.frame.origin.y,
                                              width: 60, height: keyboardCloseView.frame.size.height))
        closeBtn.setTitle("KEYBOARDCLOSE".localized, for: .normal)
        closeBtn.setTitleColor(.black, for: .normal)
        closeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        closeBtn.addTarget(self, action: #selector(UITextView.closeBtn(_:)), for:.touchUpInside)
        keyboardCloseView.addSubview(closeBtn)
        self.inputAccessoryView = keyboardCloseView
    }
    
    public func closeBtn(_ sender: UIButton) {
        self.resignFirstResponder()
    }
}
