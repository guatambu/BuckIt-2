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
    var visibilityType: VisibilityType = .publicVisibility
    
    @IBOutlet weak var visibilityToggleView: VisibilityToggleView!
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
    @IBOutlet weak var publicVisibilityView: VisibilityView!
    @IBOutlet weak var privateVisibilityView: VisibilityView!
    var textFieldBorderWidth: CGFloat = 0
    var textFieldBorderColor: CGColor!
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupGoalImageView()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTextView()
    }

    // MARK: - UI
    private func setupVisibilityViews() {
        privateVisibilityView.delegate = self
        publicVisibilityView.delegate = self
        
        
    }
    
    private func setupTextView() {
        additionalInfoTextView.layer.borderColor = UIColor(hexString: "#cdcdcd").cgColor
        additionalInfoTextView.layer.cornerRadius = 5
        additionalInfoTextView.layer.borderWidth = 0.5
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

// MARK: - VisibilityViewDelegate
extension MyListNewItemViewController: VisibilityViewDelegate {
    func visibilityView(_ view: VisibilityView, willToggleVisibilityTypeOnTap: Any) {
        print("🤶\(#function)")
        
        
    }
    
}
