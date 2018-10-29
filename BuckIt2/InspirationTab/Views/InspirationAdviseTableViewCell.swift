//
//  InspirationAdviseTableViewCell.swift
//  BuckIt2
//
//  Created by Eric Andersen on 10/23/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class InspirationAdviseTableViewCell: UITableViewCell {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var adviseLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}











//    adviseCell?.imageView?.translatesAutoresizingMaskIntoConstraints = false
//    NSLayoutConstraint.activate([
//    (adviseCell?.contentView.topAnchor.constraint(equalTo: (adviseCell?.topAnchor)!, constant: 0))!,
//    (adviseCell?.contentView.leadingAnchor.constraint(equalTo: (adviseCell?.leadingAnchor)!, constant: 0))!,
//    (adviseCell?.contentView.trailingAnchor.constraint(equalTo: (adviseCell?.trailingAnchor)!, constant: 0))!,
//    (adviseCell?.contentView.bottomAnchor.constraint(equalTo: (adviseCell?.bottomAnchor)!, constant: 0))!,
////  (adviseCell?.contentView.heightAnchor.constraint(equalToConstant: adviseCellHeight()))!,
//    (adviseCell?.contentView.widthAnchor.constraint(equalToConstant: 301))!,
//
//    (adviseCell?.imageView?.topAnchor.constraint(equalTo: (adviseCell?.contentView.topAnchor)!, constant: 0))!,
//    (adviseCell?.imageView?.leadingAnchor.constraint(equalTo: (adviseCell?.contentView.leadingAnchor)!, constant: 15))!,
////  (adviseCell?.imageView?.trailingAnchor.constraint(equalTo: (adviseCell?.textLabel?.leadingAnchor)!, constant: 15))!,
////  (adviseCell?.imageView?.bottomAnchor.constraint(equalTo: (adviseCell?.bottomAnchor)!, constant: (adviseCellHeight() - 50)))!,
//    (adviseCell?.imageView?.heightAnchor.constraint(equalToConstant: 50))!,
//    (adviseCell?.imageView?.widthAnchor.constraint(equalToConstant: 50))!,
//    (adviseCell?.imageView?.heightAnchor.constraint(equalTo: (adviseCell?.imageView?.widthAnchor)!, multiplier: 1, constant: 0))!,
//
//    (adviseCell?.textLabel?.topAnchor.constraint(equalTo: (adviseCell?.contentView.topAnchor)!, constant: 5))!,
//    (adviseCell?.textLabel?.leadingAnchor.constraint(equalTo: (adviseCell?.imageView?.trailingAnchor)!, constant: 15))!,
//    (adviseCell?.textLabel?.trailingAnchor.constraint(equalTo: (adviseCell?.contentView.trailingAnchor)!, constant: 5))!,
//    (adviseCell?.textLabel?.bottomAnchor.constraint(equalTo: (adviseCell?.detailTextLabel?.bottomAnchor)!, constant: 0))!,
//    (adviseCell?.textLabel?.heightAnchor.constraint(equalToConstant: 20.5))!,
//    (adviseCell?.textLabel?.widthAnchor.constraint(equalToConstant: 221))!,
//
//    (adviseCell?.detailTextLabel?.topAnchor.constraint(equalTo: (adviseCell?.textLabel?.bottomAnchor)!, constant: 0))!,
//    (adviseCell?.detailTextLabel?.leadingAnchor.constraint(equalTo: (adviseCell?.imageView?.trailingAnchor)!, constant: 20))!,
//    (adviseCell?.detailTextLabel?.trailingAnchor.constraint(equalTo: (adviseCell?.contentView.trailingAnchor)!, constant: 5))!,
//    (adviseCell?.detailTextLabel?.bottomAnchor.constraint(equalTo: (adviseCell?.bottomAnchor)!, constant: 0))!,
////  (adviseCell?.detailTextLabel?.heightAnchor.constraint(equalToConstant: (adviseCell?.detailTextLabel?.bounds.size.height)!))!,
//    (adviseCell?.detailTextLabel?.widthAnchor.constraint(equalToConstant: 221))!
//    ])
