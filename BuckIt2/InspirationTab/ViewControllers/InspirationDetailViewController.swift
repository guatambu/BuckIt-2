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
        commonItemsTableView.delegate = self
        commonItemsTableView.dataSource = self
        adviseTableView.delegate = self
        adviseTableView.dataSource = self
        setUPUI()
        updateView()
    }
    
    
    // MARK: - Functions
    func updateView() {
        itemNameLabel.text = bucketListItem?.title
    }
    
    func setUPUI() {
        itemNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    static func dismisse() {
        let inspirationDetailVC = InspirationDetailViewController()
        inspirationDetailVC.dismiss(animated: true, completion: nil)
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
        return bucketListItem?.mockPhoto?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationItemPhotosCell", for: indexPath) as? InspirationItemDetailPhotosCollectionViewCell
        cell?.itemDetailImageView.image = bucketListItem?.mockPhoto?[indexPath.row]
        
        return cell ?? UICollectionViewCell()
    }
}

extension InspirationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLayoutSubviews(){
        
        commonItemsTableView.frame = CGRect(x: commonItemsTableView.frame.origin.x, y: commonItemsTableView.frame.origin.y, width: commonItemsTableView.frame.size.width, height: commonItemsTableView.contentSize.height)
        commonItemsTableView.reloadData()
        
        adviseTableView.frame = CGRect(x: adviseTableView.frame.origin.x, y: adviseTableView.frame.origin.y, width: adviseTableView.frame.size.width, height: adviseTableView.contentSize.height)
        adviseTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        if tableView == commonItemsTableView {
            count = MockDataUsers.shared.getMockUsers().count
        } else if tableView == adviseTableView {
            count = bucketListItem?.mockPhoto?.count ?? 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if tableView == commonItemsTableView {
            let sharingCell = commonItemsTableView.dequeueReusableCell(withIdentifier: "inspirationSharingUsersCell")
            let user = MockDataUsers.shared.getMockUsers()[indexPath.row]
            DispatchQueue.main.async {
                sharingCell?.imageView?.image = user.mockProfilePic
            }
            sharingCell?.textLabel?.text = "\(user.firstName!) \(user.lastName!)"
            cell = sharingCell ?? UITableViewCell()
        }
        
        if tableView == adviseTableView {
            let adviseCell = adviseTableView.dequeueReusableCell(withIdentifier: "inspirationAdviceCell")
            let item = bucketListItem!
            DispatchQueue.main.async {
                adviseCell?.imageView?.image = item.user.mockProfilePic
            }
            adviseCell?.textLabel?.text = "@\(item.user.username)"
            adviseCell?.detailTextLabel?.text = item.experienceDescription
            cell = adviseCell ?? UITableViewCell()
        }
        
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
