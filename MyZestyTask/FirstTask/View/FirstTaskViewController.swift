//
//  ViewController.swift
//  Hello
//
//  Created by Sharaf on 20/08/2023.
//

import UIKit
import CoreImage.CIFilterBuiltins

final class FirstTaskViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var originalImageView: UIImageView!
    
    //MARK: - Properties
    private let viewModel: FirstTaskViewModelProtocol
    private var image: CIImage? = nil
    private var cancellableBag = CancellableBag()
    private let context = CIContext(options: nil)
    //MARK: - Init
    init(viewModel: FirstTaskViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupViewModelObservers()
        viewModel.loadImage()
    }
    
    private func applyFilter(indexPath:IndexPath) {
        let row = indexPath.row
        switch row {
            case 0:
                let char = CharFilter(ciImage: image!)
                viewModel.applyFilter(filter: char)
            case 1:
                let willow = WillowFilter(ciImage: image!)
                viewModel.applyFilter(filter: willow)
            case 2:
                let gold = GoldFilter(ciImage: image!)
                viewModel.applyFilter(filter: gold)
            case 3:
                let amaro = AmaroFilter(ciImage: image!)
                viewModel.applyFilter(filter: amaro)
            case 4:
                let dawn = DawnFilter(ciImage: image!)
                viewModel.applyFilter(filter: dawn)
            case 5:
                let custom = CustomFilter(ciImage: image!)
                viewModel.applyFilter(filter: custom)
            default:
                return
        }
    }
    
    private func setupCollectionView() {
        collectionView.register(FilterCollectionViewCell.nib, forCellWithReuseIdentifier: FilterCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupViewModelObservers() {
        viewModel.image.sink(receiveValue: {[weak self] image in
            self?.viewModel.loadDataSource(image: image)
            self?.image = image
            guard  let cgImage = self?.context.createCGImage(image, from: image.extent) else { return }
            self?.originalImageView.image = UIImage(cgImage: cgImage)
        }).store(in: &cancellableBag)
        
        viewModel.dataSource.sink(receiveValue: {[weak self] _ in
            self?.collectionView.reloadData()
        }).store(in: &cancellableBag)
        
        viewModel.filteredImage.sink(receiveValue: { [weak self] image in
            self?.originalImageView.image = image
        }).store(in: &cancellableBag)
    }
}


extension FirstTaskViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.dataSource.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.identifier, for: indexPath) as! FilterCollectionViewCell
        cell.configure(with: viewModel.dataSource.value[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (Int(UIScreen.main.bounds.width) / 6) , height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.applyFilter(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
}

