//
//  Protocols.swift
//  Photo Editor
//
//  Created by Mohamed Hamed on 6/15/17.
//
//

import Foundation
import UIKit

 protocol PhotoEditorDelegate {
    
    func doneEditing(image: UIImage)
}

protocol ColorDelegate {
    func didSelectColor(color: UIColor)
}
