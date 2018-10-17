//
//  MyListViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MyListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var myBioTextView: UITextView!
    @IBOutlet weak var todoCompletedSegmentedControl: UISegmentedControl!
    
    var bucketList: [BucketListItem] = []
    var toDoItems: [BucketListItem] = []
    var completedItems: [BucketListItem] = []
    
    
    // MARK: - ViewController Lifecycle Functions
    
    override func viewWillAppear(_ animated: Bool) {
        MyListController.shared.filterCompleted(bucketListItems: MyListController.shared.myBucketListItems)
        toDoItems = MyListController.shared.toDoItems
        completedItems = MyListController.shared.completedItems
        bucketList = MyListController.shared.myBucketListItems
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let button = UIButton(type: UIButton.ButtonType.custom)
//        button.setImage(UIImage(named: "settings.png"), for: UIControl.State.normal)
//        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//        let barButton = UIBarButtonItem(customView: button)
//        self.navigationItem.rightBarButtonItems = [barButton]
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - Actions
    @IBAction func settingsButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func changedSegmentController(_ sender: UISegmentedControl) {
    }
}

