//
//  PhotoEditorViewController.swift
//  PhotoEditor
//
//  Created by Sharaf on 20/08/2023.
//

import UIKit

final class PhotoEditorViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var canvasView: UIView!
    @IBOutlet var loadedImage: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var canvasImageView: UIImageView!
    @IBOutlet weak var topToolbar: UIView!
    @IBOutlet weak var bottomToolbar: UIView!
    @IBOutlet weak var topGradient: UIView!
    @IBOutlet weak var bottomGradient: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    @IBOutlet weak var colorPickerView: UIView!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    //MARK: - Properties
    var image: UIImage? = nil
    var colors  : [UIColor] = []
    var photoEditorDelegate: PhotoEditorDelegate?
    var colorsCollectionViewDelegate: ColorsCollectionViewDelegate!
    var hiddenControls : [control] = []
    var textColor: UIColor = UIColor.white
    var lastTextViewTransform: CGAffineTransform?
    var lastTextViewTransCenter: CGPoint?
    var lastTextViewFont:UIFont?
    var activeTextView: UITextView?
    var isTyping: Bool = false
    
    //MARK: - LifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        guard let image = image else {
            print("NoImage")
            return
        }
        setImageView(image: image)
        setupCollectionView()
        hideControls()
    }
    
    //MARK: - Methods
    
    private func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 30, height: 30)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        colorsCollectionView.collectionViewLayout = layout
        colorsCollectionViewDelegate = ColorsCollectionViewDelegate()
        colorsCollectionViewDelegate.colorDelegate = self
        if !colors.isEmpty {
            colorsCollectionViewDelegate.colors = colors
        }
        colorsCollectionView.delegate = colorsCollectionViewDelegate
        colorsCollectionView.dataSource = colorsCollectionViewDelegate
        colorsCollectionView.register(ColorCollectionViewCell.nib, forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
    }
    
    private func setImageView(image: UIImage) {
        loadedImage.image = image
        guard let size = image.suitableSize(widthLimit: UIScreen.main.bounds.width) else { return }
        imageViewHeightConstraint.constant = size.height
    }
    
    private func hideToolbar(hide: Bool) {
        topToolbar.isHidden = hide
        topGradient.isHidden = hide
        bottomToolbar.isHidden = hide
        bottomGradient.isHidden = hide
    }
}

extension PhotoEditorViewController: ColorDelegate {
    func didSelectColor(color: UIColor) {
        if activeTextView != nil {
            activeTextView?.textColor = color
            textColor = color
        }
    }
}
