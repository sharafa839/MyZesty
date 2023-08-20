//
//  UIVIew+Extension.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import UIKit

extension UIView {
    static var nib : UINib {
        return UINib(nibName : "\(self)",bundle : nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func roundCorner(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func toImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.isOpaque, 0.0)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: false)
        let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return snapshotImageFromMyView!
    }
}
