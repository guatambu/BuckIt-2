//
//  MessageListCell.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/15/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class MessageListCell: UITableViewCell, ReuseIdentifiable {

    // MARK: - Properties
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Subviews
    @IBOutlet weak var messageGlimpseLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateView() {
        guard let user = user else { return }
        
        profileImageView.image = user.mockProfilePic
        usernameLabel.text = user.username
        
        #warning("set message glimpse label")
    }
}
