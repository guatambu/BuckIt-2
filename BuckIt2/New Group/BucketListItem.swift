//
//  BucketListItem.swift
//  BuckIt
//
//  Created by Michael Guatambu Davis on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

extension BucketListItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
        hasher.combine(timestamp)
    }
}

class BucketListItem {
    
    // MARK: - Properties
    let uid: String
    let user: User
    let timestamp: Date
    var title: String
    var isComplete: Bool
    var isPrivate: Bool
    var itemColor: ItemColor
    var mockPhoto: [UIImage]?
    var photoURLs: [String]?
    var experienceDescription: String?
    
    var firebaseDictionary: [String: Any] {
        return [
            BucketListItemKey.uid: uid,
            BucketListItemKey.user: user,
            BucketListItemKey.timestamp: timestamp,
            BucketListItemKey.title: title,
            BucketListItemKey.isComplete: isComplete,
            BucketListItemKey.photoURLs: photoURLs as Any,
            BucketListItemKey.experienceDescription: experienceDescription as Any
        ]
    }
    
    // MARK: - Firebase Keys
    
    enum BucketListItemKey {
        
        // Top Level Item
        static let bucketListItem = "bucketListItem"
        
        // Properties
        static let uid = "uid"
        static let user = "user"
        static let timestamp = "timestamp"
        static let title = "title"
        static let isComplete = "isComplete"
        static let isPrivate = "isPrivate"
        static let itemColor = "itemColor"
        static let photoURLs = "photoURLs"
        static let experienceDescription = "experienceDescription"
    }
    
    
    // MARK: - Initialization
    
    // MockData
    init(uid: String,
        user: User,
        timestamp: Date,
        title: String,
        isComplete: Bool = false,
        isPrivate: Bool = false,
        itemColor: ItemColor = .none,
        mockPhoto: [UIImage]?,
        experienceDescription: String? = nil
        ) {
        
        self.uid = uid
        self.user = user
        self.timestamp = timestamp
        self.title = title
        self.isComplete = isComplete
        self.isPrivate = isPrivate
        self.itemColor = itemColor
        self.mockPhoto = mockPhoto
        self.experienceDescription = experienceDescription
    }
    
    // Firebase
    init(uid: String,
         user: User,
         timestamp: Date,
         title: String,
         isComplete: Bool,
         isPrivate: Bool,
         itemColor: ItemColor,
         photoURLs: [String],
         experienceDescription: String
        ) {
        
        self.uid = uid
        self.user = user
        self.timestamp = timestamp
        self.title = title
        self.isComplete = isComplete
        self.isPrivate = isPrivate
        self.itemColor = itemColor
        self.photoURLs = photoURLs
        self.experienceDescription = experienceDescription
    }
    
    
    
    
    
}

// Firebase Initialization
extension BucketListItem {
    convenience init?(bucketListItemDictionary: [String : Any]) {
        guard let uid = bucketListItemDictionary[BucketListItemKey.uid] as? String,
            let user = bucketListItemDictionary[BucketListItemKey.user] as? User,
            let timestamp = bucketListItemDictionary[BucketListItemKey.timestamp] as? Date,
            let title = bucketListItemDictionary[BucketListItemKey.title] as? String,
            let isComplete = bucketListItemDictionary[BucketListItemKey.isComplete] as? Bool,
            let isPrivate = bucketListItemDictionary[BucketListItemKey.isPrivate] as? Bool,
            let itemColorString = bucketListItemDictionary[BucketListItemKey.itemColor] as? String,
            let photoURLs = bucketListItemDictionary[BucketListItemKey.photoURLs] as? [String],
            let experienceDescription = bucketListItemDictionary[BucketListItemKey.experienceDescription] as? String else { return nil }
        
        
        // Changeeeee
        let color: ItemColor = .blue
        
        self.init(uid: uid,
                  user: user,
                  timestamp: timestamp,
                  title: title,
                  isComplete: isComplete,
                  isPrivate: isPrivate,
                  itemColor: color,
                  photoURLs: photoURLs,
                  experienceDescription: experienceDescription)
    }
}

extension BucketListItem: Equatable {
    
    // Equatable Protocol Function
    static func ==(lhs: BucketListItem, rhs: BucketListItem) -> Bool {
        return lhs.uid == rhs.uid
    }
}
