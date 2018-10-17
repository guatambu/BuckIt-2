//
//  MyListController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/17/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import Foundation

class MyListController {
    
    // MARK - Properties
    
    static var shared = MyListController()
    
    var myBucketListItems: [BucketListItem] = []
    
    
    // MARK: CRUD Functions
    
    // Create
    
    func createBucketList(, isPrivate: Bool) {
        var newBucketList = BucketList(items: <#T##[BucketListItem]#>, isPrivate: <#T##Bool#>)
        myBucketListItems = newBucketList
    }
    
    // Read
    
    // Update
    
    func addItemToBucketList() {
        
    }
    
    // Delete
    
    func deleteItemFromBucketList() {
        
    }
    
    
    // MARK: - Helper Methods
    
    func filterToDo(<#parameters#>) -> <#return type#> {
        
        <#function body#>
    }
    
    func filterCompleted(<#parameters#>) -> <#return type#> {
        
        <#function body#>
    }
    
}
