//
//  ForgotPasswordViewController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/21/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var resetPasswordLabelOutlet: UILabel!
    @IBOutlet weak var resetUserMessageLabelOutlet: UILabel!
    @IBOutlet weak var errorMessageStackView: UIStackView!
    @IBOutlet weak var errorMessageLine1LabelOutlet: UILabel!
    @IBOutlet weak var errorMessageLine2LabelOutlet: UILabel!
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var sendEmailButtonOutlet: DesignableButton!
    
    
    
    // MARK: - ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func xToCloseButtonTapped(_ sender: UIBarButtonItem) {
        // pop viewController
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func sendEmailButtonTapped(_ sender: Any) {
        
        // **** check with dev team:
    // *****  firebase fuctionality  *****
        
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
