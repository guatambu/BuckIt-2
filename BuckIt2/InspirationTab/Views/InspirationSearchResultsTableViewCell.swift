//
//  InspirationSearchResultsTableViewCell.swift
//  BuckIt2
//
//  Created by Eric Andersen on 10/21/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class InspirationSearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var profileIcon: UIImageView!
    
    
    var filteredData = InspirationSearchTableViewController.filteredData
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func updateViews() {
        titleLabel.text = "\(filteredData)"
        subtitleLabel.text = nil
        profileIcon.image = #imageLiteral(resourceName: "defaultPhoto")
    }

}
