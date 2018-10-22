//
//  FinishUserProfileViewController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/21/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class FinishUserProfileViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var finishProfileLabelOutlet: UILabel!
    @IBOutlet weak var errorMessageStackView: UIStackView!
    @IBOutlet weak var errorMessageLine1LabelOutlet: UILabel!
    @IBOutlet weak var errorMessageLine2LabelOutlet: UILabel!
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var emailTextFieldOutlet: UITextField!
    @IBOutlet weak var profilePicLabelOutlet: UILabel!
    @IBOutlet weak var addProfilePicViewOutlet: UIView!
    
    var userAccount: User?
    
    
    // MARK: - ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    
    @IBAction func xToCloseButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addProfilePicButtonTapped(_ sender: Any) {
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
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
