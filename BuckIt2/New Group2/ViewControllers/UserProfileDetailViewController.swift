//
//  UserProfileDetailViewController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class UserProfileDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var profilePicOutlet: UIImageView!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var cityLabelOutlet: UILabel!
    @IBOutlet weak var editProfileButtonOutlet: UIButton!
    @IBOutlet weak var userBioLabelOutlet: UILabel!
    @IBOutlet weak var borderViewOutlet: UIView!
    @IBOutlet weak var logoutViewOutlet: UIView!
    
    var user: User?
    
    
    // MARK: - ViewController Lifecycle Functions

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let user = user else { return }
        
        self.title = user.username
        self.profilePicOutlet.image = user.mockProfilePic
        self.nameLabelOutlet.text = "\(user.firstName) \(user.lastName)"
        self.cityLabelOutlet.text = user.location
        //self.userBioLabelOutlet.text = user.bio
    }
    
    
    // MARK: - Actions
    
    @IBAction func editProfileButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
    }
    
}
