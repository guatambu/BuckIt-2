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
    
    static let message1 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.sam, text: "How did you like the nude beach", timestamp: Date())
    
    static let message2 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
    
    static let message3 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
    
    static let message4 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
    
    static let message5 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
    
    static let message6 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
    
    static let message7 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
    
    static let message8 = Message(uid: UUID().uuidString, sender: MockDataUsers.dylon, receiver: MockDataUsers.luisa, text: "How did you like the nude beach", timestamp: Date())
}
