//
//  InspirationSearchTableViewController.swift
//  BuckIt2
//
//  Created by Eric Andersen on 10/20/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class InspirationSearchTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
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
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            for item in data {
                if item.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(item)
                }
            }
            searching = true
            print(searchText)
        } else {
            searching = false
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
//    func updateSearchResultsForSearchController(searchController: UISearchController) {
//
//        //filterSearchController(searchController.searchBar)
//
//        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
//            filteredData.removeAll()
//            for index in 0..<data.count {
//                if data[index].lowercased().contains(searchText.lowercased()) {
//                    filteredData.append(data[index])
//                }
//            }
//            searching = true
//
//        } else {
//            searching = false
//        }
//
//        tableView.reloadData()
//    }
    
    
        
}

extension InspirationSearchTableViewController {
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searching ? filteredData.count : data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inspirationSearchCell", for: indexPath)
        let row = indexPath.row
        
        // Configure the cell...
        cell.textLabel?.text = filteredData[row]
        
        return cell
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
