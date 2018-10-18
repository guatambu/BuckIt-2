//
//  UserLoginViewController.swift
//  BuckIt
//
//  Created by Kelly Johnson on 10/12/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var loginLabelOutlet: UILabel!
    @IBOutlet weak var emailUsernameLabelOutlet: UILabel!
    @IBOutlet weak var emailUsernameTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var dontHaveAccountLabelOutlet: UILabel!
    @IBOutlet weak var errorMessageStackViewOutlet: UIStackView!
    @IBOutlet weak var errorLine1LabelOutlet: UILabel!
    @IBOutlet weak var errorLine2LabelOutlet: UILabel!
    
    var users = [MockDataUsers.dylon, MockDataUsers.luisa, MockDataUsers.maggie, MockDataUsers.park, MockDataUsers.rodrigo, MockDataUsers.sangita]
    
    
    // MARK: - ViewController Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        errorMessageStackViewOutlet.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func closeXButtonTapped(_ sender: UIButton) {
        
        // pop viewController
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        
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
        
        guard let emailUsername = emailUsernameTextFieldOutlet.text, emailUsernameTextFieldOutlet.text != "" else {
            
            if emailUsernameTextFieldOutlet.text = "" {
                errorMessageStackViewOutlet.isHidden = false
                errorLine1LabelOutlet.text = "Please enter your username or email address."
            }
            return
        }
        
        guard let password = passwordTextFieldOutlet.text, passwordTextFieldOutlet.text != "" else {
            
            if passwordTextFieldOutlet.text = "" {
                errorMessageStackViewOutlet.isHidden = false
                errorLine1LabelOutlet.text = "Please enter your password."
            }
            return
        }
        
        for user in users {
            
            if (emailUsername != user.username) || (emailUsername != user.email) {
                errorMessageStackViewOutlet.isHidden = false
                errorLine1LabelOutlet.text = "Please enter a valid username or email address."
            } else if ((emailUsername == user.username) && (password == user.password)) || ((emailUsername == user.email) && (password == user.password)) {
                
                // pop viewController
                self.navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
        
        // programmatically performing the segue
        
        // instantiate the relevant storyboard
        let mainView: UIStoryboard = UIStoryboard(name: "UserAuthentication", bundle: nil)
        // instantiate the desired TableViewController as ViewController on relevant storyboard
        let destViewController = mainView.instantiateViewController(withIdentifier: "toUserCreateAccount")
        // create the segue programmatically
        self.navigationController?.pushViewController(destViewController, animated: true)
        // set the desired properties of the destinationVC's navgation Item
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = "Login"
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
