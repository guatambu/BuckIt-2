//
//  User.swift
//  
//
//  Created by Michael Guatambu Davis on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class User {
    
    // MARK: - Properties
    
    let uid: String
    let email: String
    let username: String
    var isPrivate: Bool
    var firstName: String?
    var lastName: String?
    var mockProfilePic: UIImage?
    //var profileImageURL: String?
    var location: String?
    var age: String?
    
//    var firebaseDictionary: [String: Any] {
//        return [
//            UserKey.uid: uid,
//            UserKey.email: email,
//            UserKey.username: username,
//            UserKey.isPrivate: isPrivate,
//            UserKey.firstName: firstName as Any,
//            UserKey.lastName: lastName as Any,
//            UserKey.profileImageURL: profileImageURL as Any,
//            UserKey.location: location as Any,
//            UserKey.age: age as Any
//        ]
//    }
    
    
    // MARK: - Firebase Keys
    
    enum UserKey {

        // Top Level Item
        static let users = "users"

        // Properties
        static let uid = "uid"
        static let email = "email"
        static let username = "username"
        static let isPrivate = "isPrivate"
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let profileImageURL = "profileImageURL"
        static let location = "location"
        static let age = "age"
    }
    
    // MARK: - Initialization
    
    init(uid: String,
         email: String,
         username: String,
         isPrivate: Bool,
         firstName: String?,
         lastName: String?,
         mockProfilePic: UIImage?,
         //profileImageURL: String?,
         location: String?,
         age: String?
        ) {
        
        self.uid = uid
        self.email = email
        self.username = username
        self.isPrivate = isPrivate
        self.firstName = firstName
        self.lastName = lastName
        self.mockProfilePic = mockProfilePic
        //self.profileImageURL = profileImageURL
        self.location = location
        self.age = age
    }
    
    
//    convenience init?(userDictionary: [String : Any]) {
//        guard let uid = firebaseDictionary[UserKey.uid] as? String,
//            let email = firebaseDictionary[UserKey.email] as? String,
//            let username = firebaseDictionary[UserKey.username] as? String,
//            let isPrivate = firebaseDictionary[UserKey.isPrivate] as? Bool,
//            let firstName = firebaseDictionary[UserKey.firstName] as? String,
//            let lastName = firebaseDictionary[UserKey.lastName] as? String,
//            let profileImageURL = firebaseDictionary[UserKey.profileImageURL] as? String,
//            let location = firebaseDictionary[UserKey.location] as? String,
//            let age = firebaseDictionary[UserKey.age] as? String else { return nil }
//
//        self.init(uid: uid,
//                  email: email,
//                  username: username,
//                  isPrivate: isPrivate,
//                  firstName: firstName,
//                  lastName: lastName,
//                  profileImageURL: profileImageURL,
//                  location: location,
//                  age: age)
//    }
    

    
}

extension User: Equatable {
    
    // Equatable Protocol Function
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid
    }
}





