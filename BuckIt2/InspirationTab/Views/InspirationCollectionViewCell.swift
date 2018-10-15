//
//  InspirationCollectionViewCell.swift
//  BuckIt
//
//  Created by Eric Andersen on 10/11/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class InspirationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var inspirationImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
     }
   
    
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        updateViews()
//    }
    
    
    func updateViews() {
        inspirationImageView.image = UIImage(named: "defaultPhoto")
        itemTitleLabel.text = "Arrive By Seaplane"
    }
    
    
    @IBAction func quickAddButtonTapped(_ sender: UIButton) {
    }
}
