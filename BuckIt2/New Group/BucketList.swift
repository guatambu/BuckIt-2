//
//  BucketList.swift
//  BuckIt
//
//  Created by Michael Guatambu Davis on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class BucketList {
    
    // MARK: - Properties
    
    var items: [BucketListItem]
    var isPrivate: Bool
    
    var firebaseDictionary: [String: Any] {
        return [
            BucketListKey.items: items,
            BucketListKey.isPrivate: isPrivate
        ]
    }
    
    // MARK: - Firebase Keys
    
    enum BucketListKey {
        
        // Top Level Item
        static let bucketList = "bucketList"
        
        // Properties
        static let items = "items"
        static let isPrivate = "isPrivate"
    }
    
    
    // MARK: - Initialization
    
    init(items: [BucketListItem], isPrivate: Bool) {
        
        self.items = items
        self.isPrivate = isPrivate
    }
    
    convenience init?(bucketListDictionary: [String : Any]) {
        guard let items = firebaseDictionary[BucketListKey.items] as? [BucketListItem],
            let isPrivate = firebaseDictionary[BucketListKey.isPrivate] as? Bool else { return nil }
        
        self.init(items: items,
                  isPrivate: isPrivate)
    }
}

extension BucketList: Equatable {
    
    // Equatable Protocol Function
    static func ==(lhs: BucketList, rhs: BucketList) -> Bool {
        return lhs.items == rhs.items && lhs.isPrivate == rhs.isPrivate
    }
}
