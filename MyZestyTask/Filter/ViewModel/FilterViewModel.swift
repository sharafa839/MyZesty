//
//  FirstTaskViewModel.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import Foundation
import CoreImage
import Combine
import UIKit


typealias CancellableBag = Set<AnyCancellable>
typealias PassSubject<Value> = PassthroughSubject<Value, Never>
typealias ValueSubject<Value> = CurrentValueSubject<Value, Never>


protocol FilterViewModelProtocol {
    var dataSource: ValueSubject<[Filters]> { get }
    var image: ValueSubject<CIImage> { get }
    var filteredImage: PassSubject<UIImage> { get }
    func applyFilter(filter: GenerateFilter)
    func loadImage()
    func loadDataSource(image: CIImage)
}

final class FilterViewModel: FilterViewModelProtocol {
    
    //MARK: - Properties
    var dataSource = ValueSubject<[Filters]>([])
    var image = ValueSubject<CIImage>(CIImage())
    var filteredImage = PassSubject<UIImage>()

    let context = CIContext(options: nil)
    //MARK: - Init
    deinit {
        print("deinit\(Self.self)")
    }
    //MARK: - Methods
    
    func loadImage() {
        DispatchQueue.global()
            .async {
                guard let imageURL = Bundle.main.url(forResource: "33", withExtension: ".jpg") else { return }
                DispatchQueue.main.async {
                    guard let ciImage = CIImage(contentsOf: imageURL) else { return }
                    self.image.send(ciImage)
                }
            }
    }
    
    func loadDataSource(image: CIImage) {
        DispatchQueue.global()
            .async {
                    let filters: [Filters] = [.init(filter: CharFilter(ciImage: image)),
                                              .init(filter: WillowFilter(ciImage: image)),
                                              .init(filter: GoldFilter(ciImage: image)),
                                              .init(filter: AmaroFilter(ciImage: image)),
                                              .init(filter: DawnFilter(ciImage: image)),
                                              .init(filter: CustomFilter(ciImage: image))]
                    DispatchQueue.main.async {
                        self.dataSource.send(filters)
                    }
            }
    }
    
    func applyFilter(filter: GenerateFilter) {
        filter.applyFilter {[weak self] image in
            guard let context = self?.context.createCGImage(image, from: image.extent) else { return }
            self?.filteredImage.send(UIImage(cgImage: context))
        }
    }
}
