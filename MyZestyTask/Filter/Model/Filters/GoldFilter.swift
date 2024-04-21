//
//  GoldFilter.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import CoreImage

struct GoldFilter: GenerateFilter {
    var ciImage: CIImage
    var name = "Gold"
    
    func applyFilter(compeletion: @escaping ((CIImage) -> Void)) {
        let filter = CIFilter.falseColor()
        filter.color0 = .yellow
        filter.color1 = .black
        filter.inputImage = ciImage
        guard let result = filter.outputImage else { return }
        compeletion(result)
    }
}
