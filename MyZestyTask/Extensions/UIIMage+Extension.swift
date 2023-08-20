//
//  UIIMage+Extension.swift
//  MyZestyTask
//
//  Created by Sharaf on 21/08/2023.
//

import Foundation
import UIKit

extension UIImage {
   func suitableSize(heightLimit: CGFloat? = nil,
                     widthLimit: CGFloat? = nil )-> CGSize? {
       if let height = heightLimit {
           
           let width = (height / self.size.height) * self.size.width
           
           return CGSize(width: width, height: height)
       }
       
       if let width = widthLimit {
           let height = (width / self.size.width) * self.size.height
           return CGSize(width: width, height: height)
       }
       
       return nil
   }
}
