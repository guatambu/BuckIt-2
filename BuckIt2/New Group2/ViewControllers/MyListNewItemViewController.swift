//
//  MyListNewItemViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MyListNewItemViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var goalNametextField: UITextField! {
        didSet {
            additionalInfoTextView.layer.borderWidth = goalNametextField.layer.borderWidth
            additionalInfoTextView.layer.borderColor = goalNametextField.layer.borderColor
        }
    }
    @IBOutlet weak var addTagsTextField: UITextField!
    @IBOutlet weak var privateButton: UIButton!
    @IBOutlet weak var publicButton: UIButton!
    @IBOutlet weak var privateLabel: UILabel!
    @IBOutlet weak var publicLabel: UILabel!
    @IBOutlet weak var additionalInfoTextView: UITextView!
    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    var textFieldBorderWidth: CGFloat = 0
    var textFieldBorderColor: CGColor!
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupGoalImageView()

        scrollView.isUserInteractionEnabled = true
        contentView.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTextView()
    }

    // MARK: - UI
    private func setupEyes() {
        
    }
    
    private func setupTextView() {
        additionalInfoTextView.layer.borderColor = UIColor(hexString: "#cdcdcd").cgColor
        
//        let textFieldCornerRadius = goalNametextField.layer.cornerRadius
//        let textFieldBorderWidth = goalNametextField.layer.borderWidth
        additionalInfoTextView.layer.cornerRadius = 5
        additionalInfoTextView.layer.borderWidth = 0.5
        
//        additionalInfoTextView.clipsToBounds = true
        additionalInfoTextView.text = ""
    }
    
    private func setupGoalImageView() {
        goalImageView.isHidden = true
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func privateButtonTapped(_ sender: Any) {
        print("🤶\(#function)")
    }
    @IBAction func publicButtonTapped(_ sender: Any) {
        print("🤶\(#function)")
    }
    
    @IBAction func colorPickerButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func addToListButtonTapped(_ sender: UIButton) {
        print("🤶\(#function)")
    }
    
    @IBAction func addPhotosButtonTapped(_ sender: Any) {
        print("🤶\(#function)")
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

extension MyListNewItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension MyListNewItemViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
