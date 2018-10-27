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
    
    @IBOutlet weak var newGoalStackView: UIStackView!
    @IBOutlet weak var myListHeaderView: MyListHeaderView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bucketListMainLabelOutlet: UILabel!
    @IBOutlet weak var segmentedControlOutlet: DesignableSegmentedControl!
    @IBOutlet weak var addItemButtonOutlet: DesignableButton!
    @IBOutlet weak var addNewItemLabelOutlet: UILabel!
    
    lazy var profileButton: UIBarButtonItem = {
        let button = UIButton(type: .custom)
        button.setImage(self.profileImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 32).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        // Math doesn't work here, needs a constant value
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(profileButtonTapped(sender:)), for: .touchUpInside)
        return UIBarButtonItem.init(customView: button)
    }()
    
    var currentUser = MockDataUsers.sam
    var user: User? = MockDataUsers.sam
    
    var profileImage: UIImage {
        return currentUser.mockProfilePic!.withRenderingMode(.alwaysOriginal)
    }
    
    var bucketList: [BucketListItem] = [MockDataBucketListItems.item2, MockDataBucketListItems.item6, MockDataBucketListItems.item16, MockDataBucketListItems.item23, MockDataBucketListItems.item17, MockDataBucketListItems.item1, MockDataBucketListItems.item3, MockDataBucketListItems.item4]
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
        
        self.navigationItem.leftBarButtonItem = profileButton
        
        // set TVC title to user.username
        self.navigationItem.title = user?.username
        
        // set bottom of nav bar border color
        
        //if design team wants to have a more specific border in terms of the width of the border then we need a .jpg of their border to be plugged in here:
        // self.navigationController?.navigationBar.shadowImage = UIImage(named: <#T##String#>)
        segmentedControlOutlet.tintColor = GojiTheme.primaryPink.value
        segmentedControlOutlet.borderColor = GojiTheme.primaryPink.value
        addItemButtonOutlet.backgroundColor = GojiTheme.primaryPink.value
        
        displayedBucketItems = toDoItems
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentControl()
        setupAddItemButton()
    }
    
    // MARK: - UI
    private func setupSegmentControl() {
        let fontAttribute: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17, weight: .semibold)]
        segmentedControlOutlet.setTitleTextAttributes(fontAttribute, for: .normal)
    }
    
    private func setupAddItemButton() {
        addItemButtonOutlet.setTitle("+", for: .normal)
        addItemButtonOutlet.titleLabel?.textAlignment = .center
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
            displayedBucketItems = toDoItems
            newGoalStackView.arrangedSubviews.areVisible()
        case 1:
            displayedBucketItems = completedItems
            newGoalStackView.isHidden = true
        default:
            print("not an acceptable choice from the two segmented controller options in MyListTableViewController.swift")
        }
        
        tableView.reloadData()
    }
    
    
    @IBAction func addNewItemButtonTapped(_ sender: DesignableButton) {
        let storyboard = UIStoryboard(name: "MyListNewItem", bundle: nil)
        let myListNewItemViewController = storyboard.instantiateViewController(withIdentifier: "MyListNewItemViewController")
        present(myListNewItemViewController, animated: true, completion: nil)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            let destinationVC = segue.destination as? MyListDetailItemViewController
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            
            
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "", sender: self)
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


extension Sequence where Iterator.Element == UIView {
    func areHidden() {
        forEach { $0.isHidden = true }
    }
    
    func areVisible() {
        forEach { $0.isHidden = false }
    }
}
