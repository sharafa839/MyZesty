//
//  PhotoEditor+Controls.swift
//  PhotoEditor
//
//  Created by Sharaf on 20/08/2023.
//

import Foundation
import UIKit

// MARK: - Control
enum control {
    case text
    case save
}

extension PhotoEditorViewController {
    
    //MARK: - IBActions
    
    @IBAction func textButtonTapped(_ sender: Any) {
        doneButton.isHidden = false
        colorPickerView.isHidden = false
        hideToolbar(hide: true)
        isTyping = true
        let textView = UITextView(frame: CGRect(x: 0, y: canvasImageView.center.y,
                                                width: UIScreen.main.bounds.width, height: 30))
        
        textView.textAlignment = .center
        textView.font = UIFont(name: "Helvetica", size: 30)
        textView.textColor = textColor
        textView.layer.shadowColor = UIColor.black.cgColor
        textView.layer.shadowOffset = CGSize(width: 1.0, height: 0.0)
        textView.layer.shadowOpacity = 0.2
        textView.layer.shadowRadius = 1.0
        textView.layer.backgroundColor = UIColor.clear.cgColor
        textView.autocorrectionType = .no
        textView.isScrollEnabled = false
        textView.delegate = self
        self.canvasImageView.addSubview(textView)
        textView.becomeFirstResponder()
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        view.endEditing(true)
        doneButton.isHidden = true
        colorPickerView.isHidden = true
        canvasImageView.isUserInteractionEnabled = true
        hideToolbar(hide: false)
    }
    
    //MARK: Bottom Toolbar
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        UIImageWriteToSavedPhotosAlbum(canvasView.toImage(),self, #selector(PhotoEditorViewController.image(_:withPotentialError:contextInfo:)), nil)
    }
    
    
    @IBAction func continueButtonPressed(_ sender: Any) {
        let image = self.canvasView.toImage()
        photoEditorDelegate?.doneEditing(image: image)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: -  methods
    
    @objc func image(_ image: UIImage, withPotentialError error: NSErrorPointer, contextInfo: UnsafeRawPointer) {
        let alert = UIAlertController(title: "Image Saved", message: "Image successfully saved to Photos library", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func hideToolbar(hide: Bool) {
        topToolbar.isHidden = hide
        topGradient.isHidden = hide
        bottomToolbar.isHidden = hide
        bottomGradient.isHidden = hide
    }
    
    func hideControls() {
        for control in hiddenControls {
            switch control {
                case .save:
                    saveButton.isHidden = true
                default: return
            }
        }
    }
    
}
