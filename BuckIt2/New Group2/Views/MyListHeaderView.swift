//
//  HeaderView.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/24/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class MyListHeaderView: UIView {

    // MARK: - Properties
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Subviews
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI
    func updateView() {
        guard let user = user else { return }
        
        profileImageView.image = user.mockProfilePic
        fullnameLabel.text = user.fullName
        locationLabel.text = user.location
        bioLabel.text = user.bioBlurb
    }
    
}
