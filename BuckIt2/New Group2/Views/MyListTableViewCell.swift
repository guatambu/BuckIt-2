//
//  MyListTableViewCell.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/24/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

protocol MyListTableViewCellDelegate: class {
    func myListTableViewCell(_ cell: MyListTableViewCell, markIsCompleteFor item: BucketListItem)
}

class MyListTableViewCell: UITableViewCell, ReuseIdentifiable {

    // MARK: - Properties
    weak var delegate: MyListTableViewCellDelegate?
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
        
        if item.isComplete {
            itemDoneButton.setImage(UIImage(named: "checkmarkSelected"), for: .normal)
            
        } else {
            itemDoneButton.setImage(nil, for: .normal)
        }
        
        if item.isPrivate {
            eyeImageView.image = UIImage(named: "privateEye")
        } else {
            eyeImageView.image = nil
        }
    }
    
    @IBAction func itemDoneButtonTapped(_ sender: UIButton) {
        print("🤶\(#function)")
        guard let item = bucketListItem else { return }
        delegate?.myListTableViewCell(self, markIsCompleteFor: item)
    }
    
}
