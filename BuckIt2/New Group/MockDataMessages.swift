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
        
        let message9 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "You too!", timestamp: Date())
        
        let mockMessages = [message1, message2, message3, message4, message5, message6, message7, message8, message9]
        
        return mockMessages
        
    }
}

struct MockConversation {
    
    static var allDictionary = [MockDataUsers.shared.park.uid: MockConversation.withPark,
                      MockDataUsers.shared.dylon.uid: MockConversation.withDylon,
                      MockDataUsers.shared.luisa.uid: MockConversation.withLuisa,
                      MockDataUsers.shared.maggie.uid: MockConversation.withMaggie,
                      MockDataUsers.shared.rodrigo.uid: MockConversation.withRodrigo,
                      MockDataUsers.shared.sangita.uid: MockConversation.withSangita]
    
    static var all = [MockConversation.withPark,
    MockConversation.withDylon,
    MockConversation.withLuisa,
    MockConversation.withMaggie,
    MockConversation.withRodrigo,
    MockConversation.withSangita]
    
    static var currentConversations = Array(MockConversation.all[..<3])
    static var potentialConversations = Array(MockConversation.all[3...])
    
    static var withDylon: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.shared.dylon)
    }
    
    static var withMaggie: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.shared.maggie)
    }
    
    static var withPark: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.shared.park)
    }
    
    static var withRodrigo: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.shared.rodrigo)
    }
    
    static var withSangita: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.sangita)
    }

    static var withLuisa: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.shared.luisa)
    }

}
