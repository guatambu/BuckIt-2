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
    @IBOutlet weak var dontHAveAccountLabelOutlet: UILabel!
    
    
    // MARK: - ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func closeXButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func loginButtonTapped(_ sender: DesignableButton) {
    }
    
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
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
