//
//  InspirationHomeViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class InspirationHomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var inspirationCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    var bucketListItem: BucketListItem?
    
    
    // MockData
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    
    var searching = false
    var filteredData: [String] = []
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScopeBar()
        setUPUI()
        
        navigationItem.title = "Goji"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.hidesSearchBarWhenScrolling = true
    }

}


extension InspirationHomeViewController: UISearchBarDelegate {
    
    // Setup the Scope Bar
    func setupScopeBar() {
        let searchResultsTableVC = InspirationSearchTableViewController()
        let searchController = UISearchController(searchResultsController: searchResultsTableVC)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        searchController.searchBar.scopeButtonTitles = ["ideas", "people"]
        searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        searchController.searchResultsUpdater = searchResultsTableVC
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //filterSearchController(searchBar)
    }
}


extension InspirationHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, InspirationLayoutDelegate {
    
    func setUPUI() {
        inspirationCollectionView.delegate = self
        inspirationCollectionView.dataSource = self
        inspirationCollectionView.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        guard let layout = inspirationCollectionView.collectionViewLayout as? InspirationLayout else { return }
        layout.delegate = self
    }

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return (MockDataBucketListItems.mockDataItems[indexPath.row].mockPhoto?.first?.size.height)! / 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockDataBucketListItems.mockDataItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationCell", for: indexPath) as? InspirationCollectionViewCell
        let bucketListitem = MockDataBucketListItems.mockDataItems[indexPath.row]
        cell?.bucketListItem = bucketListitem

        return cell ?? UICollectionViewCell()
    }

    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellToInspirationDetailVC" {
            let destinationVC = segue.destination as? InspirationDetailViewController
            guard let cell = sender as? InspirationCollectionViewCell,
                let indexPath = inspirationCollectionView.indexPath(for: cell) else { return }
            let bucketListItem = MockDataBucketListItems.mockDataItems[indexPath.row] as BucketListItem
            destinationVC?.bucketListItem = bucketListItem
            
            destinationVC?.view.translatesAutoresizingMaskIntoConstraints = true
            navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIImageView(image: #imageLiteral(resourceName: "back")))
            navigationItem.backBarButtonItem?.tintColor = .white
        }
    }
}
