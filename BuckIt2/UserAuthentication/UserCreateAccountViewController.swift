//
//  UserCreateAccountViewController.swift
//  BuckIt
//
//  Created by Michael Guatambu Davis on 10/12/18.
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
    
    // ***** for mock data purposes
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
        
        // ***** for mock data purposes
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
            
            // ***** for mockdata purposes
            newUserAccount = User(uid: uid, email: email, username: username, password: password, isPrivate: true, firstName: nil, lastName: nil, mockProfilePic: nil, location: nil, age: nil)
            
            // ***** important UX feature here *****
                // depending on the segue identifier or sending VC, this will determine how we exit the function via segue
                // design wants user taken to inspiration page if they are creating account from the splash/landing page when app first loads
                // otherwise, design wants user to create and account from wherever they are in app and be returned to that same place in app with minimal interruption to user
            
            
            // toggle isUserLoggedIn property upon success
            UserController.shared.isUserLoggedIn = true
            
            // IF USER IS AT SPLASH PAGE AND WANTS TO CREATE ACCOUNT...
                // do the following here for the segue
            // programmatically performing the segue
            
            // instantiate the relevant storyboard
            let mainView: UIStoryboard = UIStoryboard(name: "InspirationHome", bundle: nil)
            // instantiate the desired TableViewController as ViewController on relevant storyboard
            guard let destViewController = mainView.instantiateViewController(withIdentifier: "InspirationHome") as? InspirationHomeViewController else {
                
                print("*** Error: error instantiating FinishUserProfileViewController in UserCreateAccountViewController.swift line 131")
                return
            }
            
            // create the modal segue programmatically
            self.present(destViewController, animated: true, completion: nil)
            
            // pass necessary info to destViewController
            //destViewController.userAccount = newUserAccount
            
            // All OTHER APP LOCATIONS AND USER WANTS TO CREATE ACCOUNT...
                // do the following here for the segue
            
            // pop viewController - this is if we want to just leave
            self.navigationController?.popViewController(animated: true)
            // pass necessary info to destViewController
            //destViewController.userAccount = newUserAccount
            
    // *****  firbase functionality  *****
            
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        // programmatically performing the segue
        
        // instantiate the relevant storyboard
        let mainView: UIStoryboard = UIStoryboard(name: "UserAuthentication", bundle: nil)
        // instantiate the desired TableViewController as ViewController on relevant storyboard
        let destViewController = mainView.instantiateViewController(withIdentifier: "toUserLogin")
        // create the modal segue programmatically
        self.present(destViewController, animated: true, completion: nil)
        // set the desired properties of the destinationVC's navgation Item
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = "Create Account"
        navigationItem.backBarButtonItem = backButtonItem
    }
}
