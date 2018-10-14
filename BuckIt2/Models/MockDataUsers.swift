//
//  MockDataUsers.swift
//  BuckIt
//
//  Created by Kelly Johnson on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

struct MockDataUsers {
    
    // Users
    
    static let maggie = User(uid: "01", email: "maggie@email.com", username: "TotsMcGoats", isPrivate: true, firstName: "Margaret", lastName: "Thompson", mockProfilePic: UIImage(contentsOfFile: "maggie"), location: "earth", age: "30")
    
    static let rodrigo = User(uid: "02", email: "rodrigo@email.com", username: "rodrigo31", isPrivate: false, firstName: "Rodrigo", lastName: "Santoro", mockProfilePic: UIImage(contentsOfFile: "rodrigo"), location: "Venezuela", age: "19")
    
    static let dylon = User(uid: "03", email: "dylon@email.com", username: "dylonjefferson", isPrivate: true, firstName: "Dylon", lastName: "Jefferson", mockProfilePic: UIImage(contentsOfFile: "dylon"), location: "Washington", age: "25")
    
    static let luisa = User(uid: "04", email: "luisa@email.com", username: "luluu", isPrivate: false, firstName: "Luisa", lastName: "Morães da Silva", mockProfilePic: UIImage(contentsOfFile: "luisa"), location: "São Paulo, São Paulo, Brasil", age: "35")
    
    static let park = User(uid: "05", email: "park@email.com", username: "parkhan", isPrivate: true, firstName: "Park", lastName: "Han", mockProfilePic: UIImage(contentsOfFile: "park"), location: "Tokyo, Japan", age: "40")
    
    static let sangita = User(uid: "06", email: "sangita@email.com", username: "sangiji", isPrivate: false, firstName: "Sangita", lastName: "Chaudry", mockProfilePic: UIImage(contentsOfFile: "sangita"), location: "London, England, UK", age: "51")
    
}

