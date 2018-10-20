//
//  ChatViewController.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/16/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit
import MessageKit

enum ChatType {
    case ongoing
    case new
}

class ChatViewController: MessagesViewController {

    private var _currentUser: User?
    private var _chatPartner: User?
    private var chatType: ChatType = .ongoing
    private var messages: [Message] = []
    
    private var currentUser: User {
        return _currentUser!
    }
    
    private var chatPartner: User {
        return _chatPartner!
    }
    
    init() {
       super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(currentUser: User, chatType: ChatType) {
        self.init()
        
        self._currentUser = currentUser
        self.chatType = chatType

    }
    
    convenience init(currentUser: User, chatPartner: User, chatType: ChatType = .ongoing) {
        self.init()
        
        self._currentUser = currentUser
        self._chatPartner = chatPartner
        self.chatType = chatType
    }
    
    convenience init(currentUser: User, chatPartner: User, messages: [Message]) {
        self.init(currentUser: currentUser, chatPartner: chatPartner)
        
        self.messages = messages
           
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if chatType == .new {
            setupSearchBar()
            title = "New Message"
            // TODO: - Make search bar a searchcontroller?
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tabBarController?.tabBar.isHidden = false
        
        navigationController?.popToRootViewController(animated: true)
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
    
    func isPreviousMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard indexPath.section - 1 >= 0 else { return false }
        return messages[indexPath.section].sender == messages[indexPath.section - 1].sender
    }
    
    func isNextMessageSameSender(at indexPath: IndexPath) -> Bool {
        guard indexPath.section + 1 < messages.count else { return false }
        return messages[indexPath.section].sender == messages[indexPath.section + 1].sender
    }

    // MARK: - UICollectionViewDataSource
    // Used the set the MessageLabelDelegate and MessageLabelDelegate
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let messagesDataSource = messagesCollectionView.messagesDataSource else {
            fatalError("Ouch. nil data source for messages")
        }
        
        let message = messagesDataSource.messageForItem(at: indexPath, in: messagesCollectionView)
        
        if case .text = message.kind {
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TextMessageCell.self), for: indexPath) as? TextMessageCell else { return UICollectionViewCell() }
            cell.configure(with: message, at: indexPath, and: messagesCollectionView)
            cell.messageLabel.delegate = self
            cell.delegate = self
            
            return cell
        }
        return super.collectionView(collectionView, cellForItemAt: indexPath)
        
    }
    
}

// MARK: - Setup UI
private extension ChatViewController {
    func updateView() {
        tabBarController?.tabBar.isHidden = true
        
        switch chatType {
        case .ongoing:
            title = chatPartner.username
        case .new:
            title = "New Message"
        }
    }
    
    func configureMessageLabel() {
        
    }
    
    func configureMessagesCollectionView() {
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        
        scrollsToBottomOnKeybordBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
        
        guard let layout = messagesCollectionView.collectionViewLayout as?  MessagesCollectionViewFlowLayout else { return }
        layout.attributedTextMessageSizeCalculator.outgoingAvatarSize = .zero
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
    
    func setupSearchBar() {
        let searchBar = UISearchBar()
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        searchBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        messagesCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        
        searchBar.delegate = self
        searchBar.placeholder = "Search for people"
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

    func enabledDetectors(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> [DetectorType] {
        #warning("Make detectors functional")
        return [.url, .address, .phoneNumber, .date, .transitInformation]
    }
    
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        let chatPartnerColor = #colorLiteral(red: 0.9960784314, green: 0.4431372549, blue: 0.4666666667, alpha: 1)
        let lighterGray = #colorLiteral(red: 0.9137254902, green: 0.9137254902, blue: 0.9137254902, alpha: 1)
        return isFromCurrentSender(message: message) ? lighterGray : chatPartnerColor
    }
    
    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> Bool {
        return false
    }

    func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return isFromCurrentSender(message: message) ? .black : .white
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        
        return .bubble

    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        let avatar = getAvatar(for: message.sender)
        avatarView.isHidden = isNextMessageSameSender(at: indexPath)
        
//        #warning("MockDataUsers.sam == the current user")
//        if message.sender.displayName == MockDataUsers.sam.username {
//            avatarView.isHidden = true
//        } else {
//        }
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

// MARK: - MessageLabelDelegate

extension ChatViewController: MessageLabelDelegate {
    
    func didSelectAddress(_ addressComponents: [String: String]) {
        print("Address Selected: \(addressComponents)")
    }
    
    func didSelectDate(_ date: Date) {
        print("Date Selected: \(date)")
    }
    
    func didSelectPhoneNumber(_ phoneNumber: String) {
        print("Phone Number Selected: \(phoneNumber)")
    }
    
    func didSelectURL(_ url: URL) {
        print("URL Selected: \(url)")
    }
    
    func didSelectTransitInformation(_ transitInformation: [String: String]) {
        print("TransitInformation Selected: \(transitInformation)")
    }
    
}

extension ChatViewController: MessageCellDelegate {
    func didTapAvatar(in cell: MessageCollectionViewCell) {
        print("did tap avatar")
    }
}

extension ChatViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

