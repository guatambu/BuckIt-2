//
//  Message.swift
//  BuckIt
//
//  Created by Michael Guatambu Davis on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class Message {
    
    // MARK: - Properties
    
    let uid: String
    let sender: User
    let receiver: User
    let text: String
    let timestamp: Date
    
    var firebaseDictionary: [String: Any] {
        return [
            MessageKey.uid: uid,
            MessageKey.sender: sender,
            MessageKey.receiver: receiver,
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
        static let receiver = "receiver"
        static let text = "text"
        static let timestamp = "timestamp"
    }
    
    
    // MARK: - Initialization
    
    init(uid: String,
        sender: User,
        receiver: User,
        text: String,
        timestamp: Date
        ) {
        
        self.uid = uid
        self.sender = sender
        self.receiver = receiver
        self.text = text
        self.timestamp = timestamp
    }
    
    convenience init?(messageDictionary: [String : Any]) {
        guard let uid = firebaseDictionary[MessageKey.uid] as? String,
            let sender = firebaseDictionary[MessageKey.sender] as? User,
            let receiver = firebaseDictionary[MessageKey.receiver] as? User,
            let text = firebaseDictionary[MessageKey.text] as? String,
            let timestamp = firebaseDictionary[MessageKey.timestamp] as? Date else { return nil }
        
        self.init(uid: uid,
                  sender: sender,
                  receiver: receiver,
                  text: text,
                  timestamp: timestamp)
    }
    
    
    
    
}

extension Message: Equatable {
    
    // Equatable Protocol Function
    static func ==(lhs: Message, rhs: Message) -> Bool {
        return lhs.uid == rhs.uid
    }
}
