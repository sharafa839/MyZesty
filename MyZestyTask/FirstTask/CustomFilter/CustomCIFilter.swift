//
//  FirstFilter.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import CoreImage

class CustomCIFilter: CIFilter {
    private let kernal: CIColorKernel
    @objc dynamic var inputImage: CIImage?
    override var outputImage: CIImage? {
        guard let inputImage = inputImage else { return nil }
        return kernal.apply(extent: inputImage.extent, arguments: [inputImage])
    }
    
    override init() {
        let url = Bundle.main.url(forResource: "default", withExtension: "metallib")!
        let data = try! Data(contentsOf: url)
        kernal = try! CIColorKernel(functionName: "customTransformation", fromMetalLibraryData: data)
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
