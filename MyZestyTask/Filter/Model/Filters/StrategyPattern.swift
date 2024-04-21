//
//  StrategyPattern.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import CoreImage

protocol GenerateFilter {
    var name: String { get set }
    var ciImage: CIImage {get set}
    func applyFilter(compeletion: @escaping ((CIImage) -> Void))
}

extension GenerateFilter {
    func applyFilter(compeletion: @escaping ((CIImage) -> Void)) {

    }
}
