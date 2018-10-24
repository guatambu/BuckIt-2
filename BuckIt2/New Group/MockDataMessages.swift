//
//  MockDataMessages.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/15/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import Foundation

struct MockDataMessages {
    
    static func messages(with chatPartner: User) -> [Message] {
        let sam = MockDataUsers.sam
        let message1 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "Hi! I see you did a color run.", timestamp: Date())
        
        let message2 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "Yes it was so much fun!", timestamp: Date())
        
        let message3 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "Where was it?", timestamp: Date())
        
        let message4 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "I live is Dallas so I just went to that one lol", timestamp: Date())
        
        let message5 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "Ah cool!", timestamp: Date())
        
        let message6 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "I live near Boston so yeah I do the next one here", timestamp: Date())
        
        let message7 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "Yes do it! I am glad I did", timestamp: Date())
        
        let message8 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "I will. Thank you and good luck on your next adventure!", timestamp: Date())
        
        let message9 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "google.com", timestamp: Date())
        
        let message10 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "315-444-2234", timestamp: Date())
        
        let message11 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "october 23", timestamp: Date())
        
        let message12 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "644 north temple salt lake city", timestamp: Date())
        
        let message13 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "", timestamp: Date())
        
        
        
        let mockMessages = [message1, message2, message3, message4, message5, message6, message7, message8, message9, message10, message11, message12, message13]
        
        return mockMessages
        
    }
}

extension User: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.uid.hashValue)
        hasher.combine(self.username.hashValue)
    }
}

struct MockConversation {
    
//    static var allDictionary: [User: Conversation] = [
//                      MockDataUsers.shared.park: MockConversation.withPark,
//                      MockDataUsers.shared.dylon: MockConversation.withDylon,
//                      MockDataUsers.shared.luisa: MockConversation.withLuisa,
//                      MockDataUsers.shared.maggie: MockConversation.withMaggie,
//                      MockDataUsers.shared.rodrigo: MockConversation.withRodrigo,
//                      MockDataUsers.shared.sangita: MockConversation.withSangita
//    ]
    
    static var all = [MockConversation.withPark,
                      MockConversation.withDylon,
                      MockConversation.withLuisa,
                      MockConversation.withMaggie,
                      MockConversation.withRodrigo,
                      MockConversation.withSangita
    ]
    
    static var currentConversations = Array(MockConversation.all[..<3])
    static var potentialConversations = Array(MockConversation.all[3...])
    
    static var withDylon: Conversation {
        return Conversation(chatPartner: MockDataUsers.shared.dylon, messages: MockDataMessages.messages(with: MockDataUsers.shared.dylon))
    }
    
    static var withMaggie: Conversation {
        return Conversation(chatPartner: MockDataUsers.shared.maggie, messages: MockDataMessages.messages(with: MockDataUsers.shared.maggie))
    }
    
    static var withPark: Conversation {
        return Conversation(chatPartner: MockDataUsers.shared.park, messages: MockDataMessages.messages(with: MockDataUsers.shared.park))
    }
    
    static var withRodrigo: Conversation {
        return Conversation(chatPartner: MockDataUsers.shared.rodrigo, messages: MockDataMessages.messages(with: MockDataUsers.shared.rodrigo))
    }
    
    static var withSangita: Conversation {
        return Conversation(chatPartner: MockDataUsers.shared.sangita, messages: MockDataMessages.messages(with: MockDataUsers.sangita))
    }

    static var withLuisa: Conversation {
        return Conversation(chatPartner: MockDataUsers.shared.luisa, messages: MockDataMessages.messages(with: MockDataUsers.shared.luisa))
    }

}
