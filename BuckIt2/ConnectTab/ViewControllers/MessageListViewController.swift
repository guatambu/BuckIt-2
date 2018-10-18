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

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        deselectCell()
    }

    @IBAction func newMessageButtonTapped(_ sender: UIBarButtonItem) {
        
    }
}

// MARK: - Setup UI
private extension MessageListViewController {
    func updateView() {
        
    }
    
    func deselectCell() {
        if let index = self.messageListTableView.indexPathForSelectedRow{
            self.messageListTableView.deselectRow(at: index, animated: true)
        }
    }
}

// MARK: - UITableViewDataSouce
extension MessageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockConversation.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MessageListCell
            else { return UITableViewCell() }
        
        let mockConversation = MockConversation.all[indexPath.row]
        
        let recentMessage = mockConversation.last!

        let chatPartner = recentMessage.receiver != MockDataUsers.sam ? recentMessage.receiver : recentMessage.sentFrom
        let conversation = Conversation.init(chatPartner: chatPartner, mostRecentMessage: recentMessage)
        cell.conversation = conversation
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MessageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mockConversation = MockConversation.all[indexPath.row]

        let sentFrom = mockConversation[0].sentFrom
        let receiver = mockConversation[0].receiver
        
        let chatPartner = receiver != MockDataUsers.sam ? receiver : sentFrom
        
        let chatViewController = ChatViewController(
            currentUser: MockDataUsers.sam, chatPartner: chatPartner, messages: mockConversation)
        
        navigationController?.pushViewController(chatViewController, animated: true)        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
}
