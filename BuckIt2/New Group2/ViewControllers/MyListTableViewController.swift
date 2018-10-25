//
//  MyListTableViewController.swift
//  BuckIt2
//
//  Created by Kelly Johnson on 10/18/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class MyListTableViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var myListHeaderView: MyListHeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bucketListMainLabelOutlet: UILabel!
    @IBOutlet weak var segmentedControlOutlet: DesignableSegmentedControl!
    @IBOutlet weak var addItemButtonOutlet: DesignableButton!
    @IBOutlet weak var addNewItemLabelOutlet: UILabel!
    
    var currentUser = MockDataUsers.sam
    var user: User? = MockDataUsers.sam
    
    var bucketList: [BucketListItem] = [MockDataBucketListItems.item2, MockDataBucketListItems.item6, MockDataBucketListItems.item16, MockDataBucketListItems.item23, MockDataBucketListItems.item17, MockDataBucketListItems.item20, MockDataBucketListItems.item12, MockDataBucketListItems.item4]
    var displayedBucketItems: Set<BucketListItem> = []
    var toDoItems: Set<BucketListItem> = []
    var completedItems: Set<BucketListItem> = []

    // MARK: - ViewController Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        
        // ready arrays of userdata for display
        
        MyListController.shared.filterCompleted(bucketListItems: bucketList)
        toDoItems = Set(MyListController.shared.toDoItems)
        completedItems = Set(MyListController.shared.completedItems)
        bucketList = MyListController.shared.myBucketListItems
        
        // add round profile pic as button
        let button = UIButton.init(type: .custom)
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(user?.mockProfilePic, for: UIControl.State.normal)
        button.frame = CGRect.init(x: 0, y: 0, width: 32, height: 32) //CGRectMake(0, 0, 30, 30)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.clipsToBounds = true
        // add action to the button
        button.addTarget(self, action: #selector(profileButtonTapped(sender:)), for: .touchUpInside)
        
        // add to left nav bar button item
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        // set TVC title to user.username
        self.title = user?.username
        
        // set bottom of nav bar border color
        
        //if design team wants to have a more specific border in terms of the width of the border then we need a .jpg of their border to be plugged in here:
        // self.navigationController?.navigationBar.shadowImage = UIImage(named: <#T##String#>)
    
        
        displayedBucketItems = toDoItems
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarItem.title = "My List"
    }
    
    
    // MARK: - Actions
    
    @objc func profileButtonTapped(sender: UIButton) {
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
        // pass any desired info to new ViewController
        destViewController.user = user
    }
    
    @IBAction func changedSegmentedController(_ sender: UISegmentedControl) {
        let selectedIndex = segmentedControlOutlet.selectedSegmentIndex
        
        switch selectedIndex {
            
        case 0:
            // To-Do
            print("0 - ToDo")
            displayedBucketItems = toDoItems
        // display To-Do BucketList Items
        case 1:
            // Done
            print("1 - Completed")
            displayedBucketItems = completedItems
            // display Done Bucket List Items
        default:
            print("not an acceptable choice from the two segmented controller options in MyListTableViewController.swift")
        }
        
        tableView.reloadData()
    }
    
    
    @IBAction func addNewItemButtonTapped(_ sender: DesignableButton) {
        print("🤶\(#function)")
    }

}

// MARK: - UITableViewTableSource
extension MyListTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedBucketItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyListTableViewCell.reuseIdentifier, for: indexPath) as? MyListTableViewCell else {
            return UITableViewCell() }
        
        let item = Array(displayedBucketItems)[indexPath.row]
        
        cell.bucketListItem = item
        
        cell.delegate = self
        
        return cell
    }

}

// MARK: - UITableViewDelegate
extension MyListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
}

// MARK: - MyListTableViewCellDelegate
extension MyListTableViewController: MyListTableViewCellDelegate {
    func myListTableViewCell(_ cell: MyListTableViewCell, markIsCompleteFor item: BucketListItem) {
        if !item.isComplete {
            item.isComplete = true
            
            toDoItems.remove(item)
            completedItems.insert(item)
            
            segmentedControlOutlet.selectedSegmentIndex = 1
            
            displayedBucketItems = completedItems
            
            tableView.reloadData()
        }
    }
}
