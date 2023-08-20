//
//  CharFilter.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import CoreImage
import CoreImage.CIFilterBuiltins
import UIKit

struct CharFilter: GenerateFilter {
    var ciImage: CIImage
    var name = "Char"
    let filter = CIFilter.falseColor()
    
    func applyFilter(compeletion: @escaping((_ image: CIImage) -> Void)){
        filter.inputImage = ciImage
        filter.color0 = .black
        filter.color1 = .white
        guard let result = filter.outputImage else { return }
        compeletion(result)
    }
}


