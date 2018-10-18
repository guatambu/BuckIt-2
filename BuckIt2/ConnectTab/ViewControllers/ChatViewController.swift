//
//  ChatViewController.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/16/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit
import MessageKit

class ChatViewController: MessagesViewController {

    private var currentUser: User
    private var chatPartner: User
    private var messages: [Message] = []

    
    init(currentUser: User, chatPartner: User) {
        self.currentUser = currentUser
        self.chatPartner = chatPartner
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(currentUser: User, chatPartner: User, messages: [Message]) {
        self.init(currentUser: currentUser, chatPartner: chatPartner)
        
        self.messages = messages
        
        title = chatPartner.username
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
        configureMessagesCollectionView()
        configureMessagesInputBar()
    }
    
    func insetMessage(message: Message) {
        messages.append(message)
        messagesCollectionView.performBatchUpdates({
            messagesCollectionView.insertSections([messages.count - 1])
            if messages.count >= 2 {
                messagesCollectionView.reloadSections([messages.count - 2])
            }
        }) { [weak self] _ in
            if self?.isLastSectionVisible() == true {
                self?.messagesCollectionView.scrollToBottom(animated: true)
            }
        }
    }
    
    func isLastSectionVisible() -> Bool {
        
        guard !messages.isEmpty else { return false }
        
        let lastIndexPath = IndexPath(item: 0, section: messages.count - 1)
        
        return messagesCollectionView.indexPathsForVisibleItems.contains(lastIndexPath)
    }

}

// MARK: - Setup UI
private extension ChatViewController {
    func updateView() {
        tabBarController?.tabBar.isHidden = true
    }
    
    func configureMessagesCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        scrollsToBottomOnKeybordBeginsEditing = true // default false
        maintainPositionOnKeyboardFrameChanged = true // default false
    }
    
    func configureMessagesInputBar() {
        messageInputBar.delegate = self
        
        messageInputBar.inputTextView.placeholder = "Start a message"
    }
    
    func getAvatar(for sender: Sender) -> Avatar {
        if sender.displayName == currentUser.username {
            
            return Avatar(image: currentUser.mockProfilePic, initials: "")
        } else {
            return Avatar(image: chatPartner.mockProfilePic, initials: "")
        }
    }
}

// MARK: - MessageDataSource
extension ChatViewController: MessagesDataSource {
    func currentSender() -> Sender {
        return Sender(id: currentUser.uid, displayName: currentUser.username)
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1)])
    }
}

// MARK: - MessagesDisplayDelegate

extension ChatViewController: MessagesDisplayDelegate {

    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        let chatPartnerColor = #colorLiteral(red: 1, green: 0.3375276762, blue: 0.6399649898, alpha: 1)
        
        return isFromCurrentSender(message: message) ? .white : chatPartnerColor
    }
    
    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> Bool {
        return false
    }

    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .black : .white
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        
        let borderColor:UIColor = isFromCurrentSender(message: message) ? .black: .clear
        return .bubbleOutline(borderColor)

    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let avatar = getAvatar(for: message.sender)
        avatarView.set(avatar: avatar)
    }
}

// MARK: - MessagesLayoutDelegate
extension ChatViewController: MessagesLayoutDelegate {
    func avatarSize(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 44, height: 44)
    }
}

// MARK: - MessageInputBarDelegate
extension ChatViewController: MessageInputBarDelegate {
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        for component in inputBar.inputTextView.components where component is String {
            if let text = component as? String {
            
                let message = Message(uid: UUID().uuidString, sentFrom: currentUser, receiver: chatPartner, text: text, timestamp: Date())
                insetMessage(message: message)
            }
        }
        inputBar.inputTextView.text =  String()
        messagesCollectionView.scrollToBottom(animated: true)
    }
}

