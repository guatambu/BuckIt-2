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

    @IBOutlet weak var messageTitleLabel: UILabel!
    @IBOutlet weak var messageListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageListTableView.dataSource = self
        messageListTableView.delegate = self
    }


    @IBAction func newMessageButtonTapped(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - Setup UI
private extension MessageListViewController {
    func updateView() {
        
    }
    

}

// MARK: - UITableViewDataSouce
extension MessageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Conversation.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MessageListCell
            else { return UITableViewCell() }
        
        let mockConversation = Conversation.all[indexPath.row]
        
        let recentMessage = mockConversation.first!
        cell.message = recentMessage
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MessageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mockConversation = Conversation.all[indexPath.row]
        
        let currentUser = mockConversation[0].sentFrom
        let chatPartner = mockConversation[0].receiver
        
        let chatViewController = ChatViewController(
            currentUser: currentUser, chatPartner: chatPartner, messages: mockConversation)
        
        navigationController?.pushViewController(chatViewController, animated: true)        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
}
