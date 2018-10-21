//
//  MockDataUsers.swift
//  BuckIt
//
//  Created by Kelly Johnson on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MockDataUsers {
    
    static let shared = MockDataUsers()

    
    // Users
    let maggie = User(uid: "01", email: "maggie@email.com", username: "TotsMcGoats", isPrivate: true, firstName: "Margaret", lastName: "Thompson", mockProfilePic: UIImage(named: "maggie"), location: "earth", age: "30")
    
    let rodrigo = User(uid: "02", email: "rodrigo@email.com", username: "rodrigo31", isPrivate: false, firstName: "Rodrigo", lastName: "Santoro", mockProfilePic: UIImage(named: "rodrigo"), location: "Venezuela", age: "19")
    
    let dylon = User(uid: "03", email: "dylon@email.com", username: "dylonjefferson", isPrivate: true, firstName: "Dylon", lastName: "Jefferson", mockProfilePic: UIImage(named: "dylon"), location: "Washington", age: "25")
    
    let luisa = User(uid: "04", email: "luisa@email.com", username: "luluu", isPrivate: false, firstName: "Luisa", lastName: "Morães da Silva", mockProfilePic: UIImage(named: "luisa"), location: "São Paulo, São Paulo, Brasil", age: "35")
    
    static let sangita = User(uid: "06", email: "sangita@email.com", username: "sangiji", isPrivate: false, firstName: "Sangita", lastName: "Chaudry", mockProfilePic: UIImage(named: "sangita"), location: "London, England, UK", age: "51")

    static let sam = User(uid: "07", email: "sam@email.com", username: "sam01", isPrivate: false, firstName: "Sam", lastName: "Russo", mockProfilePic: UIImage(named: "samantha"), location: "Seattle, Washington", age: "26", bioBlurb: "Working toward her dream job in Seattle.  She lives with roomates and just got done with college at UW.")
    
    
    static let allOtherUsers = [MockDataUsers.shared.dylon, MockDataUsers.shared.luisa, MockDataUsers.shared.maggie, MockDataUsers.shared.park, MockDataUsers.shared.rodrigo, MockDataUsers.shared.sangita]

    let park = User(uid: "05", email: "park@email.com", username: "parkhan", isPrivate: true, firstName: "Park", lastName: "Han", mockProfilePic: UIImage(named: "park"), location: "Tokyo, Japan", age: "40")
    
    let sangita = User(uid: "06", email: "sangita@email.com", username: "sangiji", isPrivate: false, firstName: "Sangita", lastName: "Chaudry", mockProfilePic: UIImage(named: "sangita"), location: "London, England, UK", age: "51")

    
    func getMockUsers() -> [User] {
        let maggie = User(uid: "01", email: "maggie@email.com", username: "TotsMcGoats", isPrivate: true, firstName: "Margaret", lastName: "Thompson", mockProfilePic: UIImage(named: "maggie"), location: "earth", age: "30")
        
        let rodrigo = User(uid: "02", email: "rodrigo@email.com", username: "rodrigo31", isPrivate: false, firstName: "Rodrigo", lastName: "Santoro", mockProfilePic: UIImage(named: "rodrigo"), location: "Venezuela", age: "19")
        
        let dylon = User(uid: "03", email: "dylon@email.com", username: "dylonjefferson", isPrivate: true, firstName: "Dylon", lastName: "Jefferson", mockProfilePic: UIImage(named: "dylon"), location: "Washington", age: "25")
        
        let luisa = User(uid: "04", email: "luisa@email.com", username: "luluu", isPrivate: false, firstName: "Luisa", lastName: "Morães da Silva", mockProfilePic: UIImage(named: "luisa"), location: "São Paulo, São Paulo, Brasil", age: "35")
        
        let park = User(uid: "05", email: "park@email.com", username: "parkhan", isPrivate: true, firstName: "Park", lastName: "Han", mockProfilePic: UIImage(named: "park"), location: "Tokyo, Japan", age: "40")
        
        let sangita = User(uid: "06", email: "sangita@email.com", username: "sangiji", isPrivate: false, firstName: "Sangita", lastName: "Chaudry", mockProfilePic: UIImage(named: "sangita"), location: "London, England, UK", age: "51")
        
        let mockUsers = [maggie, rodrigo, dylon, luisa, park, sangita]
        
        return mockUsers
    }

}
