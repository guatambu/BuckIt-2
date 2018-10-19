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
    var message: Message? {
        didSet {
            updateMessageDetails()
        }
    }
    
    var user: User? {
        return message?.receiver
    }
    
    // MARK: - Subviews
    @IBOutlet weak var messageGlimpseLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        updateView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateView() {
        usernameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        messageGlimpseLabel.font = UIFont.systemFont(ofSize: 14)
        messageGlimpseLabel.textColor = .lightGray
    }

    func updateUserDetails() {
        guard let user = user else { return }
        
        profileImageView.image = user.mockProfilePic
        usernameLabel.text = user.username
        
        roundImageView()
        
    }
    
    func updateMessageDetails() {
        guard let message = message else { return }
        guard let user = user else { return }
        
        var senderUsername = message.sender.username
        
        if message.sender.username == user.username {
            senderUsername = "You"
        }
        
        messageGlimpseLabel.text = "\(senderUsername): \(message.text)"
    
        updateUserDetails()
    }
        
    
    func roundImageView() {
        let imageViewHeight = profileImageView.bounds.height
        
        profileImageView.layer.cornerRadius = imageViewHeight / 2
        
        profileImageView.clipsToBounds = true
    }
}
