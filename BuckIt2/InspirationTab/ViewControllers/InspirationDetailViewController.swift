//
//  InspirationDetailViewController.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class InspirationDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var detailItemCollectionView: UICollectionView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var sharingTabView: UIView!
    @IBOutlet weak var completedTabView: UIView!
    @IBOutlet weak var commonItemsTableView: UITableView!
    @IBOutlet weak var adviseTableView: UITableView!
    
    
    // MARK: - Properties
    var bucketListItem: BucketListItem?
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailItemCollectionView.delegate = self
        detailItemCollectionView.dataSource = self
        updateView()
    }
    
    
    // MARK: - Functions
    func updateView() {
        itemNameLabel.text = bucketListItem?.title
    }

    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
    }
}

extension InspirationDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MockDataBucketListItems.shared.bucketListItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationItemPhotosCell", for: indexPath) as? InspirationItemDetailPhotosCollectionViewCell
        cell?.itemDetailImageView.image = bucketListItem?.mockPhoto?[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
}

extension InspirationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
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
