//
//  VisibilityToggleView.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/26/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

class VisibilityToggleView: UIView {

    lazy var privateVisibilityView: VisibilityView = {
        let view = VisibilityView(type: .privateVisibility)
        view.backgroundColor = .orange
        return view
    }()
    
    lazy var publicVisibilityView: VisibilityView = {
        let view = VisibilityView(type: .publicVisibility)
        view.backgroundColor = .blue
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [privateVisibilityView, publicVisibilityView])
        view.axis = .horizontal
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 4
        return view
    }()

    convenience init() {
        self.init(frame: .zero)
        
        updateView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        updateView()
        
    }
    
    func updateView() {
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        
        backgroundColor = .red
    }
}

