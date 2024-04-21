//
//  AmaroFilter.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//
import Foundation
import CoreImage

struct AmaroFilter: GenerateFilter {
    var ciImage: CIImage
    var name = "Amaro"
    func applyFilter(compeletion: @escaping ((CIImage) -> Void)) {
        let filter = CIFilter.straighten()
        filter.inputImage = ciImage
        filter.angle = 2
        guard let result = filter.outputImage else { return }
        compeletion(result)
    }
}
