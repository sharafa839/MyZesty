//
//  ColorsCollectionViewDelegate.swift
//  PhotoEditor
//
//  Created by Sharaf on 20/08/2023.
//

import UIKit

class ColorsCollectionViewDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var colorDelegate : ColorDelegate?
    var colors = [UIColor.black,
                  UIColor.darkGray,
                  UIColor.gray,
                  UIColor.lightGray,
                  UIColor.white,
                  UIColor.blue,
                  UIColor.green,
                  UIColor.red,
                  UIColor.yellow,
                  UIColor.orange,
                  UIColor.purple,
                  UIColor.cyan,
                  UIColor.brown,
                  UIColor.magenta]
    
    override init() {
        super.init()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        colorDelegate?.didSelectColor(color: colors[indexPath.item])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionViewCell", for: indexPath) as! ColorCollectionViewCell
        cell.colorView.backgroundColor = colors[indexPath.item]
        return cell
    }
    
}

