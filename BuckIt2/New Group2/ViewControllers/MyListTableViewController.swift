//
//  MyListTableViewController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class MyListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var user: User?
    
    var bucketList: [BucketListItem] = [MockDataBucketListItems.item2, MockDataBucketListItems.item6, MockDataBucketListItems.item16, MockDataBucketListItems.item23, MockDataBucketListItems.item17, MockDataBucketListItems.item20]
    var displayedBucketItems: [BucketListItem] = []
    var toDoItems: [BucketListItem] = []
    var completedItems: [BucketListItem] = []
    
    let dylon = MockDataUsers.dylon
    
    
    
    
    // MARK: - ViewController Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        // ready arrays of userdata for display
        MyListController.shared.filterCompleted(bucketListItems: bucketList)
        toDoItems = MyListController.shared.toDoItems
        completedItems = MyListController.shared.completedItems
        bucketList = MyListController.shared.myBucketListItems
        
        // add round profile pic as button
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: dylon.mockProfilePic), for: UIControlState.normal)
        button.addTarget(self, action:#selector(ViewController.callMethod), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40) //CGRectMake(0, 0, 30, 30)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        
        // add action to the button
        button.addTarget(self, action: #selector(profileButtonTapped(sender:)), for: .touchUpInside)
        
        // add to left nav bar button item
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        self.title = dylon.username
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions
    
    @objc func profileButtonTapped(sender: Button) {
        print("test")
        
        // programmatically performing the segue
        
        // instantiate the relevant storyboard
        let mainView: UIStoryboard = UIStoryboard(name: "MyList", bundle: nil)
        // instantiate the desired TableViewController as ViewController on relevant storyboard
        let destViewController = mainView.instantiateViewController(withIdentifier: "toUserProfileDetail") as! UserProfileDetailViewController
        // create the segue programmatically
        self.navigationController?.pushViewController(destViewController, animated: true)
        // set the desired properties of the destinationVC's navgation Item
        let backButtonItem = UIBarButtonItem()
        backButtonItem.title = " "
        navigationItem.backBarButtonItem = backButtonItem
        backButtonItem.tintColor = UIColor.black
        
        // mockdata for user
        user = dylon
        // pass any desired info to new ViewController
        destViewController.user = user
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
