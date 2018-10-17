//
//  MockDataMessages.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/15/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import Foundation

struct MockDataMessages {
    
    static let mockMessages = [MockDataMessages.message1, MockDataMessages.message2, MockDataMessages.message3, MockDataMessages.message4, MockDataMessages.message5, MockDataMessages.message6, MockDataMessages.message7, MockDataMessages.message8]
    
    static let message1 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message2 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message3 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message4 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message5 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message6 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message7 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message8 = Message(uid: UUID().uuidString, currentUser: MockDataUsers.dylon, chatPartner: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static func messages(with chatPartner: User) -> [Message] {
        for message in mockMessages {
            message.chatPartner = chatPartner
        }
        
        return mockMessages
    }
}

struct Conversation {
    
    static var withDylon: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.dylon)
    }
    
    static var withMaggie: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.maggie)
    }
    
    static var withPark: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.park)
    }
    
    static var withRodrigo: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.rodrigo)
    }
    
    static var withSangita: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.sangita)
    }

    static var withLuisa: [Message] {
        return MockDataMessages.messages(with: MockDataUsers.luisa)
    }

}
