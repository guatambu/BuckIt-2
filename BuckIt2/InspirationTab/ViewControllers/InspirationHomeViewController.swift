//
//  InspirationHomeViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class InspirationHomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: - Outlets
    @IBOutlet weak var inspirationSearchBar: UISearchBar!
    @IBOutlet weak var inspirationCollectionView: UICollectionView!
    
    
    // MARK: - Properties
    var bucketListItem: BucketListItem?
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUPUI()
    }

}

extension InspirationHomeViewController: InspirationLayoutDelegate {
    
    func setUPUI() {
        inspirationCollectionView.delegate = self
        inspirationCollectionView.dataSource = self
        inspirationCollectionView.contentInset = UIEdgeInsets(top: 23, left: 10, bottom: 10, right: 10)
        guard let layout = inspirationCollectionView.collectionViewLayout as? InspirationLayout else { return }
        layout.delegate = self
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
        }
     }

    
}
