//
//  FilterCollectionViewCell.swift
//  MyZestyTask
//
//  Created by Sharaf on 19/08/2023.
//

import UIKit

final class FilterCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var filterImageView: UIImageView!
    @IBOutlet weak var filterName: UILabel!
   private let context = CIContext(options: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        filterImageView.roundCorner(cornerRadius: 5)
    }
    
    func configure(with item: Filters) {
        filterName.text = item.filter.name
            item.filter.applyFilter( compeletion: {[weak self] image in
                DispatchQueue.main.async {
                    guard let image = self?.context.createCGImage(image, from: image.extent) else { return }
                    
                    self?.filterImageView.image = UIImage(cgImage: image)
                }
            })
    }
}


