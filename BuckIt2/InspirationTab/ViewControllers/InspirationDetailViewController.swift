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
    @IBOutlet var inspirationDetailView: UIView!
    @IBOutlet weak var inspirationDetailScrollView: UIScrollView!
    @IBOutlet weak var detailItemCollectionView: UICollectionView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var sharingButton: UIButton!
    @IBOutlet weak var completedButton: UIButton!
    @IBOutlet weak var sharingStackView: UIStackView!
    @IBOutlet weak var sharingButtonsStackView: UIStackView!
    @IBOutlet var itemDetailStack: [UIView]!
    @IBOutlet weak var sharingItemView: UIView!
    @IBOutlet weak var sharingItemLabel: UILabel!
    @IBOutlet weak var sharingTableView: UITableView!
    @IBOutlet weak var adviseView: UIView!
    @IBOutlet weak var adviseTableView: UITableView!
    @IBOutlet weak var quickAddButton: UIButton!
    @IBOutlet weak var adviseViewHeight: NSLayoutConstraint!
    
    
    // MARK: - Properties
    var bucketListItem: BucketListItem?
    
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailItemCollectionView.delegate = self
        detailItemCollectionView.dataSource = self
        sharingTableView.delegate = self
        sharingTableView.dataSource = self
        adviseTableView.delegate = self
        adviseTableView.dataSource = self
        setUPUI()
        updateView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setUpNavBar()
    }
    
    
    // MARK: - Functions
    func setUpNavBar() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.hidesBarsOnSwipe = false
    }
    
    func setUPUI() {
        title = ""
        itemNameLabel.adjustsFontSizeToFitWidth = true
        sharingItemView.isHidden = true
        setUpAdviseCell()
        updateHeight()
    } 
    
    func updateView() {
        itemNameLabel.text = bucketListItem?.title
    }
    
    func toggleQuickAddButton() {
        quickAddButton.isSelected = !quickAddButton.isSelected
        if quickAddButton.isSelected {
            quickAddButton.setImage(#imageLiteral(resourceName: "myBucketTab"), for: .selected)
            quickAddButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: (quickAddButton.bounds.width - 20))
//            quickAddButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 60)
            quickAddButton.setTitle("Added!", for: .selected)
            quickAddButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: ((quickAddButton.imageView?.frame.width) ?? 0), bottom: 0, right: 0)
//            quickAddButton.titleEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5)
            quickAddButton.titleLabel?.textAlignment = .center
            quickAddButton.titleLabel?.adjustsFontSizeToFitWidth = true
            quickAddButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            // MyListController.shared.myItems.append(thisItem)
        } else {
            quickAddButton.setImage(nil, for: .normal)
            quickAddButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            quickAddButton.setTitle("Add to List", for: .normal)
            quickAddButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            quickAddButton.titleLabel?.textAlignment = .center
            quickAddButton.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.3607843137, blue: 0.3647058824, alpha: 1)
            // MyListController.shared.myItems.remove(thisItem)
        }
    }
    
    func toggleSharing() {
        sharingButton.isSelected = !sharingButton.isSelected
        if sharingButton.isSelected {
            completedButton.isSelected = false
            itemDetailStack.first?.isHidden = false
            sharingButton.backgroundColor = .red
            sharingButton.titleLabel?.textColor = .white
            completedButton.backgroundColor = .clear
//            completedButton.titleLabel?.textColor = .darkText
        } else {
            itemDetailStack.first?.isHidden = true
            sharingButton.backgroundColor = .clear
            sharingButton.titleLabel?.textColor = .darkText
        }
        updateHeight()
    }
    
    func toggleCompleted() {
        completedButton.isSelected = !completedButton.isSelected
        if completedButton.isSelected {
            sharingButton.isSelected = false
            itemDetailStack.first?.isHidden = false
            completedButton.backgroundColor = .red
            completedButton.titleLabel?.textColor = .white
            sharingButton.backgroundColor = .clear
//            sharingButton.titleLabel?.textColor = .darkText
        } else {
            itemDetailStack.first?.isHidden = true
            completedButton.backgroundColor = .clear
            completedButton.titleLabel?.textColor = .darkText
        }
        updateHeight()
    }
    
    func selectedButtonIndex() -> Int {
        var index = 0
        if sharingButton.isSelected == true {
            index = 0
        } else if completedButton.isSelected == true {
            index = 1
        }
        return index
    }
    
    
    // MARK: - Actions
    @IBAction func quickAddButtonTapped(_ sender: UIButton) {
        toggleQuickAddButton()
    }
    
    @IBAction func sharingButtonTapped(_ sender: UIButton) {
        toggleSharing()
    }
    
    @IBAction func completedButtonTapped(_ sender: UIButton) {
        toggleCompleted()
    }
    
    @IBAction func seeAllButtonTapped(_ sender: UIButton) {
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
    
    override func viewDidLayoutSubviews() {
        
        sharingTableView.frame = CGRect(x: sharingTableView.frame.origin.x, y: sharingTableView.frame.origin.y, width: sharingTableView.frame.size.width, height: sharingTableView.contentSize.height)
        sharingTableView.reloadData()
        
        adviseTableView.frame = CGRect(x: adviseTableView.frame.origin.x, y: adviseTableView.frame.origin.y, width: adviseTableView.frame.size.width, height: adviseTableView.contentSize.height)
        adviseTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var count = 0
        
        if tableView == sharingTableView {
            count = MockDataUsers.shared.getMockUsers().count
        } else if tableView == adviseTableView {
            count = bucketListItem?.mockPhoto?.count ?? 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        let cellIdentifier = (selectedButtonIndex() == 0) ? "inspirationSharingUsersCell" : "inspirationCompletedUsersCell"
        sharingTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        if tableView == sharingTableView {
            let sharingCell = sharingTableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            let sharingUser = MockDataUsers.shared.getMockUsers()[indexPath.row]
            let completedUser = MockDataBucketListItems.shared.mockDataItems()[indexPath.row]
            
            if cellIdentifier == "inspirationSharingUsersCell" {
                sharingCell?.imageView?.image = sharingUser.mockProfilePic
                sharingCell?.textLabel?.text = "\(sharingUser.firstName!) \(sharingUser.lastName!)"
                cell = sharingCell ?? UITableViewCell()
                DispatchQueue.main.async {
                    self.sharingTableView.reloadData()
                }
            }
            
            if cellIdentifier == "inspirationCompletedUsersCell" {
                sharingCell?.imageView?.image = completedUser.mockPhoto?.first
                sharingCell?.textLabel?.text = completedUser.title
                cell = sharingCell ?? UITableViewCell()
                DispatchQueue.main.async {
                    self.sharingTableView.reloadData()
                }
            }
        }
        
        if tableView == adviseTableView {
            let adviseCell = adviseTableView.dequeueReusableCell(withIdentifier: "inspirationAdviceCell") as? InspirationAdviseTableViewCell
            let item = bucketListItem!
            DispatchQueue.main.async {
                adviseCell?.profilePic.image = item.user.mockProfilePic
            }
            adviseCell?.usernameLabel.text = "@\(item.user.username)"
            adviseCell?.adviseLabel.text = item.experienceDescription
            cell = adviseCell ?? UITableViewCell()
            
            adviseCell?.imageView?.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                (adviseCell?.contentView.topAnchor.constraint(equalTo: (adviseCell?.topAnchor)!, constant: 0))!,
                (adviseCell?.contentView.leadingAnchor.constraint(equalTo: (adviseCell?.leadingAnchor)!, constant: 0))!,
                (adviseCell?.contentView.trailingAnchor.constraint(equalTo: (adviseCell?.trailingAnchor)!, constant: 0))!,
                (adviseCell?.contentView.bottomAnchor.constraint(equalTo: (adviseCell?.bottomAnchor)!, constant: 0))!,
            //  (adviseCell?.contentView.heightAnchor.constraint(equalToConstant: adviseCellHeight()))!,
                (adviseCell?.contentView.widthAnchor.constraint(equalToConstant: 301))!,
                ])
        }
        
        return cell
    }
    
    
    // MARK: - Constraints
    func setUpAdviseCell() {
        adviseTableView.rowHeight = UITableView.automaticDimension
        adviseTableView.estimatedRowHeight = 50
        adviseTableView.reloadData()
    }
    
    func updateHeight() {
        let startingHeight: CGFloat = 120
        let extraHeight = adviseTableView.contentSize.height
        let totalHeight = startingHeight + extraHeight
        adviseViewHeight.constant = totalHeight
        adviseView.layoutIfNeeded()
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
