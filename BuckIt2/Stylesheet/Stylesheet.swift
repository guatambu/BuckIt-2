//
//  Stylesheet.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/24/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

enum GojiTheme {
    case primaryPink
    case grayishBrown_38
    case grayishBrown
}

extension GojiTheme {
    var value: UIColor {
        get {
            switch self {
            case .primaryPink: return UIColor(hexString: "#fd5c63")
            case .grayishBrown_38: return UIColor(hexString: "#4a4a4a", alpha: 0.38)
            case .grayishBrown: return UIColor(hexString: "#4a4a4a")
            }
        }
    }
}

enum ItemColor {
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case pink
    case none
}

extension ItemColor: CustomStringConvertible {
    var description: String {
        return hexValue
    }
}

extension ItemColor {
    var hexValue: String {
        get {
            switch self {
            case .red: return "#ff3a30" // ff3a30
            case .orange: return "#ff9500" // ff9500
            case .yellow: return "#ffcc01" // ffcc01
            case .green: return "#4cd964" // 4cd964
            case .blue: return "#007AFF" // 007AFF
            case .purple: return "#5856d7" // 5856d7
            case .pink: return "#f6746a" // f6746a
            case .none: return "#ffffff"
            }
        }
    }
}

public extension UIColor {
    convenience init(hex: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat((hex>>16)&0xFF)/255.0, green: CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat((hex)&0xFF)/255.0, alpha: CGFloat(255 * alpha) / 255)
    }
    
    convenience init(hexString: String, alpha: Double = 1.0) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (1, 1, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * alpha) / 255)
    }
}
