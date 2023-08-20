//
//  DawnFilter.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//
import Foundation
import CoreImage

struct DawnFilter: GenerateFilter {
    var name = "Dawn"
    var ciImage: CIImage = CIImage()
    func applyFilter(compeletion: @escaping ((CIImage) -> Void)) {
        let filter = CIFilter.crystallize()
            filter.inputImage = ciImage
            filter.radius = 2
            guard let result = filter.outputImage else { return }
                compeletion(result)
        }
}
