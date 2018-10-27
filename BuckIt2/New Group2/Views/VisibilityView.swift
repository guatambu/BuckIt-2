//
//  VisibilityView.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/25/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

@objc enum VisibilityType: Int {
    case publicVisibility = 0
    case privateVisibility = 1
    
    var value: String {
        get {
            switch self {
            case .publicVisibility: return "public"
            case .privateVisibility: return "private"
            }
        }
    }
}

protocol VisibilityViewDelegate: class {
    func visibilityView(_ view: VisibilityView, willToggleVisibilityTypeOnTap: Any)
}

@IBDesignable
class VisibilityView: UIView {
    
    // MARK: - Properties
    weak var delegate: VisibilityViewDelegate?
    
    var type: VisibilityType = .publicVisibility {
        didSet {
            toggleVisibilty()
        }
    }
    var isToggled = false
    var tint: UIColor = GojiTheme.primaryPink.value
    
    @IBInspectable var typeAdapter: Int {
        get {
            return self.type.rawValue
        }
        set(newType) {
            self.type = VisibilityType(rawValue: newType) ?? .publicVisibility
        }
    }
    
    @IBInspectable var toggle: Bool {
        get {
            return self.isToggled
        }
        set (newToggle) {
            isToggled = newToggle
        }
    }
    
    // MARK: - Subviews
    private lazy var visibilityImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.tintColor = tint
        return view
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = tint
        return label
    }()

    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(interactionButtonTapped(_:)))
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [visibilityImageView, textLabel])
        view.axis = .vertical
        view.alignment = .center
        view.distribution = .fillEqually
        view.spacing = 4
        return view
    }()
    
    // MARK: - Init
    convenience init(type: VisibilityType = .publicVisibility) {
        self.init(frame: .zero)
        
        self.type = type

        updateView()
        
        toggleVisibilty()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        updateView()
    }
    
    // MARK: - UI
    func updateView() {
        
        [stackView].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = false
            $0.topAnchor.constraint(equalTo: topAnchor).isActive = true
            $0.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            $0.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            $0.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        }
        
        toggleVisibilty()

        addGestureRecognizer(tapGesture)
    }
    
    
    func toggleVisibilty() {
        switch type {
        case .publicVisibility:
            textLabel.text = type.value.capitalized
            visibilityImageView.image = UIImage(named: type.value)?.withRenderingMode(.alwaysOriginal)
        case .privateVisibility:
            textLabel.text = type.value.capitalized
            visibilityImageView.image = UIImage(named: type.value)?.withRenderingMode(.alwaysOriginal)
        }
        
        switch isToggled {
        case true:
            tint = GojiTheme.primaryPink.value
            visibilityImageView.tintColor = tint
            textLabel.textColor = tint
            textLabel.isHidden = false
        case false:
            tint = GojiTheme.grayishBrown_38.value
            visibilityImageView.tintColor = tint
            textLabel.textColor = tint
            textLabel.isHidden = false
        }
        
    }
    
    
    // MARK: - Actions
    @objc func interactionButtonTapped(_ sender: Any) {
        delegate?.visibilityView(self, willToggleVisibilityTypeOnTap: sender)
    }
}



