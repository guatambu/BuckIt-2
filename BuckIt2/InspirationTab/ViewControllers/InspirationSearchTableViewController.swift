//
//  InspirationSearchTableViewController.swift
//  BuckIt2
//
//  Created by Eric Andersen on 10/20/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class InspirationSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    // MockData
    static let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    var searching = false
    static var filteredData: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
//        let bundle = Bundle(for: AnyClass.self as! AnyClass)
        let nib = UINib(nibName: "InspirationSearchResultsTableViewCell", bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: "inspirationSearchCell")
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            InspirationSearchTableViewController.filteredData.removeAll()
            for item in InspirationSearchTableViewController.data {
                if item.lowercased().contains(searchText.lowercased()) {
                    InspirationSearchTableViewController.filteredData.append(item)
                }
            }
            searching = true
            print(searchText)
            print(InspirationSearchTableViewController.filteredData)
        } else {
            searching = false
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension InspirationSearchTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(InspirationSearchTableViewController.filteredData)
        return searching ? InspirationSearchTableViewController.filteredData.count : InspirationSearchTableViewController.data.count
//        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inspirationSearchCell", for: indexPath) as? InspirationSearchResultsTableViewCell
        let filteredDataItem = InspirationSearchTableViewController.filteredData[indexPath.row]
        
        // Configure the cell...
//        cell.textLabel?.text = filteredDataItem
//        print(cell.textLabel?.text)
        
        cell?.titleLabel.text = filteredDataItem
        cell?.subtitleLabel.text = filteredDataItem
        cell?.profileIcon.image = #imageLiteral(resourceName: "defaultPhoto")
        return cell ?? UITableViewCell()
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
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
