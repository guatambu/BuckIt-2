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
    @IBOutlet weak var alreadyHaveAccountLabelOutlet: UILabel!
    
    var newUserAccount: User?
    var uid: String?
    
    
    
    // MARK: ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func closeXButtonTapped(_ sender: Any) {
        
    // we have the option of either popping off this viewController or performing a programmatic segue....
        
        // pop viewController
        
        self.navigationController?.popViewController(animated: true)
        
    // or
        
        // programmatically performing the segue
        
        // instantiate the relevant storyboard
        let mainView: UIStoryboard = UIStoryboard(name: "UserAuthentication", bundle: nil)
        // instantiate the desired TableViewController as ViewController on relevant storyboard
        let destViewController = mainView.instantiateViewController(withIdentifier: /* STRING OF STORYBOARD ID */)
        // create the segue programmatically
        self.navigationController?.pushViewController(destViewController, animated: true)
        // set the desired properties of the destinationVC's navgation Item
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = "Login"
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        
        guard let uid = uid else {
            
            // error handling from Firebase
            
            return
            
        }
        guard let username = usernameTextFieldOutlet.text, usernameTextFieldOutlet.text!= "" else {
            
            // error handling
            
            // throw up alert controller or error message per design preference
            
            return
            
        }
        guard let email = usernameTextFieldOutlet.text, emailTextFieldOutlet.text!= "" else {
            
            // error handling
            
            // throw up alert controller or error message per design preference
            
            return
            
        }
        
        newUserAccount = User(uid: uid, email: email, username: username, isPrivate: true, firstName: nil, lastName: nil, mockProfilePic: nil, location: nil, age: nil)
        
        
    // we have the option of either popping off this viewController or performing a programmatic segue....
        
        // pop viewController
        
        self.navigationController?.popViewController(animated: true)
        
    // or
        
        // programmatically performing the segue
        
        // instantiate the relevant storyboard
        let mainView: UIStoryboard = UIStoryboard(name: "UserAuthentication", bundle: nil)
        // instantiate the desired TableViewController as ViewController on relevant storyboard
        let destViewController = mainView.instantiateViewController(withIdentifier: /* STRING OF STORYBOARD ID */)
        // create the segue programmatically
        self.navigationController?.pushViewController(destViewController, animated: true)
        // set the desired properties of the destinationVC's navgation Item
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = "Login"
        navigationItem.backBarButtonItem = backButtonItem
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}