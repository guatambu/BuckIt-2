//
//  FinishUserProfileViewController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/21/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class FinishUserProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Properties
    
    // title
    @IBOutlet weak var finishProfileLabelOutlet: UILabel!
    // error messaging
    @IBOutlet weak var errorMessageStackView: UIStackView!
    @IBOutlet weak var errorMessageLine1LabelOutlet: UILabel!
    @IBOutlet weak var errorMessageLine2LabelOutlet: UILabel!
    // email credentials outlets
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    // profile pic credentials
    @IBOutlet weak var profilePicLabelOutlet: UILabel!
    // macro aggreagte profile pic view
    @IBOutlet weak var addProfilePicViewOutlet: UIView!
    // profile pic glyph imageView
    @IBOutlet weak var placeholderProfilePicImageViewOutlet: UIImageView!
    // invisible add profile pic button outlet (entire size of addProfilePicViewOutlet)
    @IBOutlet weak var chooseProfilePicButtonOutlet: UIButton!
    // choose profile pic 'button' image DesgnableView
    @IBOutlet weak var chooseProfilePicButtonImageOutlet: DesignableView!
    // actual selected image profile pic preview complex
    @IBOutlet weak var profilePicPreviewOutlet: DesignableView!
    @IBOutlet weak var profilePicPreviewImageViewOutlet: UIImageView!
    
    var userAccount: User?
    
    var isProfilePicSelected: Bool = false
    
    // **** need to add profile pic image viewer property
    
    
    // MARK: - ViewController Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        if isProfilePicSelected {
            placeholderProfilePicImageViewOutlet.isHidden = true
            profilePicPreviewOutlet.isHidden = false
            // set constraints to move chooseProfilePicButtonImageOutlet constraints to accommodate preview pic
        } else {
            placeholderProfilePicImageViewOutlet.isHidden = false
            profilePicPreviewOutlet.isHidden = true
            // set constraints to move chooseProfilePicButtonImageOutlet constraints to accommodate placeholderProfilePicImageViewOutlet
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func xToCloseButtonTapped(_ sender: Any) {
        // pop viewController
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addProfilePicButtonTapped(_ sender: Any) {
        
        selectStillImage()
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        // *****  firebase functionality  *****
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Helper Methods
    
    // Image Picker for camera roll
    
    func selectStillImage() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let photoPicker = UIImagePickerController()
            photoPicker.delegate = self
            photoPicker.allowsEditing = true
            photoPicker.allowsEditing = true
            present(photoPicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPhotoWithInfo info: [String: Any]) {
        
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
            isProfilePicSelected = true
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
            isProfilePicSelected = true
        } else {
            isProfilePicSelected = false
            return
        }
        
        // set image to profile pic imageViewer
        if isProfilePicSelected {
            placeholderProfilePicImageViewOutlet.isHidden = true
            profilePicPreviewOutlet.isHidden = false
            profilePicPreviewImageViewOutlet.image = newImage
            // set constraints to move chooseProfilePicButtonImageOutlet constraints to accommodate preview pic
        } else {
            placeholderProfilePicImageViewOutlet.isHidden = false
            profilePicPreviewOutlet.isHidden = true
            // set constraints to move chooseProfilePicButtonImageOutlet constraints to accommodate placeholderProfilePicImageViewOutlet
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func photoPickerControllerDismiss(_ photoPicker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
