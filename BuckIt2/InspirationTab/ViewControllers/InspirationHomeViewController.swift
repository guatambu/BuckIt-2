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
    }

}


extension InspirationHomeViewController: UISearchBarDelegate {
    
    // Setup the Scope Bar
    func setupScopeBar() {
        let searchResultsTableVC = InspirationSearchTableViewController()
        let searchController = UISearchController(searchResultsController: searchResultsTableVC)
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
//        searchController.searchBar.scopeButtonTitles = ["ideas", "people"]
        searchController.dimsBackgroundDuringPresentation = false
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
        
        title = "whatever the buck"
    }

    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        return (MockDataBucketListItems.shared.mockDataItems()[indexPath.row].mockPhoto?.first?.size.height)! / 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockDataBucketListItems.shared.mockDataItems().count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationCell", for: indexPath) as? InspirationCollectionViewCell
        let bucketListitem = MockDataBucketListItems.shared.mockDataItems()[indexPath.row]
        cell?.bucketListItem = bucketListitem

        return cell ?? UICollectionViewCell()
    }

    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellToInspirationDetailVC" {
            let destinationVC = segue.destination as? InspirationDetailViewController
            guard let cell = sender as? InspirationCollectionViewCell,
                let indexPath = inspirationCollectionView.indexPath(for: cell) else { return }
            let bucketListItem = MockDataBucketListItems.shared.mockDataItems()[indexPath.row] as BucketListItem
            destinationVC?.bucketListItem = bucketListItem
            navigationItem.backBarButtonItem = UIBarButtonItem(customView: UIImageView(image: #imageLiteral(resourceName: "back")))
        }
    }
}

//class SearchContainerVC: UISearchContainerViewController {
//
//    // Init
//    init() {
//        let searchResultsTableVC = InspirationSearchTableViewController()
//        let searchVC = UISearchController(searchResultsController: searchResultsTableVC)
//        searchVC.searchBar.searchBarStyle = .minimal
//        searchVC.searchBar.showsCancelButton = true
//        searchVC.searchBar.delegate = searchResultsTableVC as? UISearchBarDelegate
//        searchVC.searchResultsUpdater = searchResultsTableVC as? UISearchResultsUpdating
//
//        let searchBar = searchVC.searchBar
//        searchBar.delegate = searchResultsTableVC as? UISearchBarDelegate
//
//        super.init(searchController: searchVC)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
