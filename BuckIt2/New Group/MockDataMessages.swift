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
    
    static let message1 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message2 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message3 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message4 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message5 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message6 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message7 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static let message8 = Message(uid: UUID().uuidString, sentFrom: MockDataUsers.sam, receiver: MockDataUsers.dylon, text: "How did you like the nude beach", timestamp: Date())
    
    static func messages(with chatPartner: User) -> [Message] {
        let sam = MockDataUsers.sam
        let message1 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "How did you like the nude beach", timestamp: Date())
        
        let message2 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "How did you like the nude beach", timestamp: Date())
        
        let message3 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "How did you like the nude beach", timestamp: Date())
        
        let message4 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "How did you like the nude beach", timestamp: Date())
        
        let message5 = Message(uid: UUID().uuidString, sentFrom: sam, receiver: chatPartner, text: "How did you like the nude beach", timestamp: Date())
        
        let message6 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "How did you like the nude beach", timestamp: Date())
        
        let message7 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "How did you like the nude beach. How did you like the nude beach.", timestamp: Date())
        
        let message8 = Message(uid: UUID().uuidString, sentFrom: chatPartner, receiver: sam, text: "Yeah go to a good one", timestamp: Date())
        
        let mockMessages = [message1, message2, message3, message4, message5, message6, message7, message8]
        
        return mockMessages
        
    }
}

struct MockConversation {
    
    static var all = [MockConversation.withPark, MockConversation.withDylon, MockConversation.withLuisa, MockConversation.withMaggie, MockConversation.withRodrigo]
    
    
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
