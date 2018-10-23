//
//  Conversation.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/17/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import FirebaseFirestore

class Conversation {
    
    var uid: String?
    var chatPartner: User
    var messages: [Message]
    var mostRecentMessage: Message? {
        return messages.last
    }
    
    var firebaseDictionary: [String: Any] {
        return [
            ConversationKey.uid: uid,
            ConversationKey.chatPartnerUid: chatPartner.uid,
            ConversationKey.messages: messages,
            ConversationKey.mostRecentMessageText: mostRecentMessage?.text,
        ]
    }
    
    init(chatPartner: User, messages: [Message] = []) {
        self.uid = nil
        self.chatPartner = chatPartner
        self.messages = messages
    }
    
//    init?(document: QueryDocumentSnapshot) {
//        let data = document.data()
//        
//        self.uid = document.documentID
//        
//    }
    
    // MARK: - Firebase Keys
    
    enum ConversationKey {
        // Top Level Item
        static let conversation = "conversation"
        
        // Properties
        static let uid = "uid"
        static let chatPartnerUid = "chatPartnerUid"
        static let mostRecentMessageText = "mostRecentMessageText"
        static let messages = "messages"
    }
}

