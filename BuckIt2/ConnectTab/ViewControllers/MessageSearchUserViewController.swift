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
    private let cellId = "connectNewMessageSearchResultsCell"
    var currentConversationsDataSource: [User] = Array(MockDataUsers.allOtherUsers[..<3])
    var potentialConversationsDataSource: [User] = Array(MockDataUsers.allOtherUsers[3...])
//    let dataSource = MockDataUsers.allOtherUsers
    lazy var filteredCurrentConversationsDataSource: [User] = self.currentConversationsDataSource
    
    var filteredPotentialConversationsDataSource: [User] = []
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        updateView()

        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchBar.becomeFirstResponder()
    }
    
    func filter(_ dataSource: [User], with searchText: String) -> [User] {
        return dataSource.filter({ (user) -> Bool in
            return user.username.contains(searchText) || user.fullName.contains(searchText)
        })
    }
}

// MARK: - Setup UI
private extension MessageSearchUserViewController {
    func updateView() {
        
    }
    
    
}

// MARK: - UITableViewDataSource
extension MessageSearchUserViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return filteredCurrentConversationsDataSource.count
        case 1:
            return filteredPotentialConversationsDataSource.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        var dataSource: [User] = []
        
        if indexPath.section == 0 {
            dataSource = filteredCurrentConversationsDataSource
        } else if indexPath.section == 1 {
            dataSource = filteredPotentialConversationsDataSource
        }
        
        let user = dataSource[indexPath.row]
        
        cell.textLabel?.text = user.username
        cell.detailTextLabel?.text = user.fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 where filteredCurrentConversationsDataSource.count > 0:
            return "Current Connections"
        case 1 where filteredPotentialConversationsDataSource.count > 0:
            return "Connect With"
        default:
            return ""
        }
    }
}

// MARK: - UITableViewDelegate
extension MessageSearchUserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        var dataSource: [User] = []
        var chatViewController = ChatViewController()
        
        if indexPath.section == 0 {
            dataSource = filteredCurrentConversationsDataSource
        } else if indexPath.section == 1 {
            dataSource = filteredPotentialConversationsDataSource
        }
        
        let chatPartner = dataSource[indexPath.row]
//
//        if dataSource == filteredPotentialConversationsDataSource {
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//            guard let indexPath = tableView.indexPath(for: cell) else { return }
//
//            filteredPotentialConversationsDataSource.remove(at: indexPath.row)
//            filteredCurrentConversationsDataSource.insert(chatPartner, at: 0)
//        }
//
        let currentUser = MockDataUsers.sam
        
        if indexPath.section == 0 {
            guard let messages = MockConversation.allDictionary[chatPartner.uid] else { return }
            chatViewController = ChatViewController(currentUser: currentUser, chatPartner: chatPartner, messages: messages)
        } else if indexPath.section == 1 {
            chatViewController = ChatViewController(currentUser: currentUser, chatPartner: chatPartner, chatType: .new)
        }
        
        //chatViewController = ChatViewController(currentUser: currentUser, chatPartner: chatPartner)
        
        let backItem = UIBarButtonItem()
        backItem.title = "Messages"
        navigationItem.backBarButtonItem = backItem
        
        guard let navCon = navigationController else { return }
        var viewControllers = navCon.viewControllers
        viewControllers.removeLast()
        viewControllers.append(chatViewController)
        navCon.setViewControllers(viewControllers, animated: true)
    }
}

extension MessageSearchUserViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            filteredCurrentConversationsDataSource = currentConversationsDataSource
            filteredPotentialConversationsDataSource = []
        } else {
            filteredCurrentConversationsDataSource = filter(currentConversationsDataSource, with: searchText)
            filteredPotentialConversationsDataSource = filter(potentialConversationsDataSource, with: searchText)
        }
        
        print(searchText.lowercased())
        tableView.reloadData()
    }
}

extension MessageSearchUserViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
