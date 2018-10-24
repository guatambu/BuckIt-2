//
//  HeaderView.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/24/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Properties
    var user: User? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Subviews
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - UI
    func updateView() {
        
    }

}
