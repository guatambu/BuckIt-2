//
//  MyListDetailItemViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MyListDetailItemViewController: UIViewController {
    
    // MARK: - Properties
    var bucketListItem: BucketListItem?

    // MARK: - Outlets
    @IBOutlet weak var additionalInfoTextView: UITextView!
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    // MARK: - Actions
    @IBAction func collapseButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func publicPrivateSwitchButtonTapped(_ sender: UISwitch) {
    }
    
    @IBAction func tipsPageButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
    }
}
