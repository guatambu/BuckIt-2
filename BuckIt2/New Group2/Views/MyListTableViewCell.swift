//
//  MyListTableViewCell.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/24/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class MyListTableViewCell: UITableViewCell, ReuseIdentifiable {

    // MARK: - Properties
    var bucketListItem: BucketListItem? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Subviews
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemDoneButton: DesignableButton!
    @IBOutlet weak var eyeImageView: UIImageView!
    @IBOutlet weak var organizerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateView() {
        guard let item = bucketListItem else { return }
        
        titleLabel.text = item.title
        
        item.isComplete ?
            itemDoneButton.setTitle("✔️", for: .normal) :
            itemDoneButton.setTitle("", for: .normal)
        
        
    }
    @IBAction func itemDoneButtonTapped(_ sender: Any) {
        print("🤶\(#function)")
    }
    
}
