//
//  MessageListViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController {
    
    private let cellId = MessageListCell.reuseIdentifier

    @IBOutlet weak var messageListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageListTableView.dataSource = self

    }


    @IBAction func newMessageButtonTapped(_ sender: UIButton) {
    }
}

// MARK: - UITableViewDataSouce
extension MessageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockDataMessages.mockMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MessageListCell
            else { return UITableViewCell() }
        
        let mockMessage = MockDataMessages.mockMessages[indexPath.row]
        
        #warning("Temp Cell view setup")
//        cell.messageGlimpseLabel.text = mockMessage.text
//        cell.usernameLabel.text = mockMessage.receiver.username
//        cell.profileImageView.image = mockMessage.receiver.mockProfilePic
//
//        cell.roundImageView()
        
        cell.message = mockMessage
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MessageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mockMessage = MockDataMessages.mockMessages[indexPath.row]
        let user = mockMessage.sender
        let chatViewController = ChatViewController(user: user, messages: MockDataMessages.mockMessages)
        navigationController?.pushViewController(chatViewController, animated: true)
        
    }
}
