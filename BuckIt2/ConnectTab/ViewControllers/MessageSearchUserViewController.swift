//
//  MessageSearchUserViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class MessageSearchUserViewController: UIViewController {

    // MARK: - Properties
    let dataSource = MockDataUsers.allOtherUsers
    var filteredDataSource: [User] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()

        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Actions
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Setup UI
private extension MessageSearchUserViewController {
    func updateView() {
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backButtonTapped(_:)))
        navigationItem.rightBarButtonItem = cancelButton
    }
}

// MARK: - UITableViewDataSource
extension MessageSearchUserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "connectNewMessageSearchResultsCell", for: indexPath)
        
        let user = filteredDataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.fullName
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MessageSearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let chatPartner = filteredDataSource[indexPath.row]
        let currentUser = MockDataUsers.sam
        let chatViewController = ChatViewController(currentUser: currentUser, chatPartner: chatPartner)
        weak var pvc = self.presentingViewController
        dismiss(animated: true) {
            
            pvc?.navigationController?.pushViewController(chatViewController, animated: true)
        }
    }
}

extension MessageSearchUserViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredDataSource = []
        } else {
            filteredDataSource = dataSource.filter({ (user) -> Bool in
                return user.username.contains(searchText) || user.fullName.contains(searchText)
            })
            
        }
        
        print(searchText.lowercased())
        tableView.reloadData()
    }
}
