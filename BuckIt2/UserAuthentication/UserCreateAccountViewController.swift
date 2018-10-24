//
//  UserCreateAccountViewController.swift
//  BuckIt
//
//  Created by Kelly Johnson on 10/12/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class UserCreateAccountViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var createAccountLabelOutlet: UILabel!
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var usernameLabelOutlet: UILabel!
    @IBOutlet weak var usernameTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var confirmPasswordLabelOutlet: UILabel!
    @IBOutlet weak var confirmPasswordTextFieldOutlet: UITextField!
    @IBOutlet weak var alreadyHaveAccountLabelOutlet: UILabel!
    @IBOutlet weak var errorMessageStackView: UIStackView!
    @IBOutlet weak var errorLine1LabelOutlet: UILabel!
    @IBOutlet weak var errorLine2LabelOutlet: UILabel!
    
    
    var newUserAccount: User?
    var uid: String?
    
    
    
    // MARK: ViewController Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        errorMessageStackView.isHidden = true

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions
    
    @IBAction func xCloseButtonTapped(_ sender: Any) {
        // pop viewController
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
        guard let uid = uid else {
            // error handling
            
            errorMessageStackView.isHidden = false
            return
        }
        
        guard let username = usernameTextFieldOutlet.text, usernameTextFieldOutlet.text != "" else {
            
            // error handling
            if self.usernameTextFieldOutlet.text != "" {
                self.errorMessageStackView.isHidden = false
                self.errorLine1LabelOutlet.text = "Please enter a username."
                self.errorLine2LabelOutlet.text = ""
            }
            
            return
        }
        
        guard let email = emailTextFieldOutlet.text, emailTextFieldOutlet.text != "" else {
            
            // error handling
            if self.emailTextFieldOutlet.text != "" {
                self.errorMessageStackView.isHidden = false
                self.errorLine1LabelOutlet.text = "Please enter a valid email address."
                self.errorLine2LabelOutlet.text = ""
            }
            
            return
        }
        
        guard let password = passwordTextFieldOutlet.text, passwordTextFieldOutlet.text != "" else {
            
            // error handling
            if self.passwordTextFieldOutlet.text != "" {
                self.errorMessageStackView.isHidden = false
                self.errorLine1LabelOutlet.text = "Please enter a password."
                self.errorLine2LabelOutlet.text = ""
            }
            
            return
        }
        
        guard let confirmPassword = confirmPasswordTextFieldOutlet.text, confirmPasswordTextFieldOutlet.text != "" else {
            
            // error handling
            if self.confirmPasswordTextFieldOutlet.text != "" {
                self.errorMessageStackView.isHidden = false
                self.errorLine1LabelOutlet.text = "Please confirm your password."
                self.errorLine2LabelOutlet.text = ""
            }
            
            return
        }
        
        if password != confirmPassword {
            errorMessageStackView.isHidden = false
            errorLine1LabelOutlet.text = "Your passwords do not match."
            errorLine2LabelOutlet.text = "Please try again."
        } else {
            
            newUserAccount = User(uid: uid, email: email, username: username, password: password, isPrivate: true, firstName: nil, lastName: nil, mockProfilePic: nil, location: nil, age: nil)
            
            // ******* design question regarding these user authnetication segues ******
            // which kind of segue do they want because of the 'X' to close the view controller in the mockups
            // pop viewController - this is if we want to just leave
            self.navigationController?.popViewController(animated: true)
            
            // programmatically performing the segue
            
            // instantiate the relevant storyboard
            let mainView: UIStoryboard = UIStoryboard(name: "UserAuthentication", bundle: nil)
            // instantiate the desired TableViewController as ViewController on relevant storyboard
            guard let destViewController = mainView.instantiateViewController(withIdentifier: "toFinishUserProfile") as? FinishUserProfileViewController else {
                
                print("*** Error: error instantiating FinishUserProfileViewController in UserCreateAccountViewController.swift line 131")
                return
            }
            // create the show segue programmatically
            self.navigationController?.pushViewController(destViewController, animated: true)
            // create the modal segue programmatically
            self.present(destViewController, animated: true, completion: nil)
            
            // set the desired properties of the destinationVC's navgation Item
            let backButtonItem = UIBarButtonItem()
            backButtonItem.title = "Create Account"
            navigationItem.backBarButtonItem = backButtonItem
            
    // *****  firbase functionality  *****
            
            // pass necessary info to destViewController
            destViewController.userAccount = newUserAccount
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        // programmatically performing the segue
        
        // instantiate the relevant storyboard
        let mainView: UIStoryboard = UIStoryboard(name: "UserAuthentication", bundle: nil)
        // instantiate the desired TableViewController as ViewController on relevant storyboard
        let destViewController = mainView.instantiateViewController(withIdentifier: "toUserLogin")
        // create the segue programmatically
        self.navigationController?.pushViewController(destViewController, animated: true)
        // set the desired properties of the destinationVC's navgation Item
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = "Create Account"
        navigationItem.backBarButtonItem = backButtonItem
    }
}
