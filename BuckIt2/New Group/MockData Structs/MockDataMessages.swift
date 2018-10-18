//
//  MockDataMessages.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/17/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import Foundation


struct MockDataMessages {
    let funnyMessage = Message(uid: "1", sender: MockDataUsers.dylon, receiver: MockDataUsers.rodrigo, text: "man, you are just the funniest dude i know!", timestamp: Date())
    
    let sillyMessage = Message(uid: "2", sender: MockDataUsers.luisa, receiver: MockDataUsers.maggie, text: "girl, you are just the silliest perosn i know!", timestamp: Date())
    
    let smartestMessage = Message(uid: "3", sender: MockDataUsers.sangita, receiver: MockDataUsers.park, text: "oh mah gawd, you are just the smartest person i know!", timestamp: Date())
    
    let fastMessage = Message(uid: "4", sender: MockDataUsers.rodrigo, receiver: MockDataUsers.luisa, text: "no way!  YOU are the fastest person i know!", timestamp: Date())
    
    let tallMessage = Message(uid: "5", sender: MockDataUsers.sangita, receiver: MockDataUsers.dylon, text: "amazing!  you are the tallest person i know!", timestamp: Date())
    
    let strongMessage = Message(uid: "6", sender: MockDataUsers.park, receiver: MockDataUsers.maggie, text: "that's so crazy!  you are the tallest person i know!", timestamp: Date())
    
    let thankYou = Message(uid: "7", sender: MockDataUsers.dylon, receiver: MockDataUsers.maggie, text: "thank you", timestamp: Date())
    
    let thanks = Message(uid: "8", sender: MockDataUsers.luisa, receiver: MockDataUsers.sangita, text: "thanks", timestamp: Date())
    
    let gracias = Message(uid: "9", sender: MockDataUsers.park, receiver: MockDataUsers.rodrigo, text: "gracias", timestamp: Date())
    
    
}

