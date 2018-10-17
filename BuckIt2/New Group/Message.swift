//
//  Message.swift
//  BuckIt
//
//  Created by Michael Guatambu Davis on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit
import MessageKit

class Message {
    
    // MARK: - Properties
    
    let uid: String
    let currentUser: User
    var chatPartner: User
    let text: String
    let timestamp: Date
    
    var firebaseDictionary: [String: Any] {
        return [
            MessageKey.uid: uid,
            MessageKey.sender: sender,
            MessageKey.chatPartner: chatPartner,
            MessageKey.text: text,
            MessageKey.timestamp: timestamp,
        ]
    }
    
    // MARK: - Firebase Keys
    
    enum MessageKey {
        
        // Top Level Item
        static let message = "message"
        
        // Properties
        static let uid = "uid"
        static let sender = "sender"
        static let chatPartner = "chatPartner"
        static let text = "text"
        static let timestamp = "timestamp"
    }
    
    
    // MARK: - Initialization
    
    init(uid: String,
        currentUser: User,
        chatPartner: User,
        text: String,
        timestamp: Date
        ) {
        
        self.uid = uid
        self.currentUser = currentUser
        self.chatPartner = chatPartner
        self.text = text
        self.timestamp = timestamp
    }
    
    convenience init?(messageDictionary: [String : Any]) {
        guard let uid = messageDictionary[MessageKey.uid] as? String,
            let currentUser = messageDictionary[MessageKey.sender] as? User,
            let chatPartner = messageDictionary[MessageKey.chatPartner] as? User,
            let text = messageDictionary[MessageKey.text] as? String,
            let timestamp = messageDictionary[MessageKey.timestamp] as? Date else { return nil }
        
        self.init(uid: uid,
                  currentUser: currentUser,
                  chatPartner: chatPartner,
                  text: text,
                  timestamp: timestamp)
    }

    
}

extension Message: MessageType {
    var sender: Sender {
        
        return Sender(id: currentUser.uid, displayName: currentUser.username)
    }
    
    var messageId: String {
        
        return uid
    }
    
    var sentDate: Date {
        
        return timestamp
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}

extension Message: Equatable {
    
    // Equatable Protocol Function
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.uid == rhs.uid
    }
}
