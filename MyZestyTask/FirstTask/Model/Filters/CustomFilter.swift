//
//  CustomFilter.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import CoreImage


struct CustomFilter: GenerateFilter {
    var ciImage: CIImage
    var name = "cutom"
    func applyFilter(compeletion: @escaping ((CIImage) -> Void)) {
            let filter = CustomCIFilter()
            filter.inputImage = ciImage
            guard let result = filter.outputImage else { return }
                compeletion(result)
    }
}
