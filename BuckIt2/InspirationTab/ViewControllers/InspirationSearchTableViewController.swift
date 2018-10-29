//
//  InspirationSearchTableViewController.swift
//  BuckIt2
//
//  Created by Eric Andersen on 10/20/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class InspirationSearchTableViewController: UIViewController, UISearchResultsUpdating {
    
    // MockData
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    var searching = false
    var filteredData: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        setupTableview()
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData.removeAll()
            for item in data {
                if item.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(item)
                }
            }
            searching = true
            print(searchText)
            print(filteredData)
        } else {
            searching = false
        }
        
        DispatchQueue.main.async {
            self.resultsTableView.reloadData()
        }
    }
    
    
    // MARK: - Search Results Controller
    lazy var resultsTableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "inspirationResultsCell")
        return view
    }()
    
    fileprivate func setupTableview() {
        view.addSubview(resultsTableView)
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        resultsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        resultsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        resultsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension InspirationSearchTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(filteredData)
        return searching ? filteredData.count : data.count
//        return filteredData.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inspirationResultsCell", for: indexPath)
        let filteredDataItem = searching ? filteredData[indexPath.row] : data[indexPath.row]
        
        // Configure the cell...
        cell.textLabel?.text = filteredDataItem
        print(cell.textLabel?.text)
        
//        cell?.titleLabel.text = filteredDataItem
//        cell?.subtitleLabel.text = filteredDataItem
//        cell?.profileIcon.image = #imageLiteral(resourceName: "defaultPhoto")
        return cell
    }
    
    // Override to support conditional editing of the table view.
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
     func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    // Override to support conditional rearranging of the table view.
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
