//
//  MyListSettingsViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/10/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MyListSettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func privacyButtonTapped(_ sender: UISwitch) {
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
    }
}
