//
//  Stylesheet.swift
//  BuckIt2
//
//  Created by Jason Goodney on 10/24/18.
//  Copyright © 2018 DunDak, LLC. All rights reserved.
//

import UIKit

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
        return "\(value.redValue),\(value.greenValue),\(value.blueValue),\(value.alphaValue)"
    }
}

extension ItemColor {
    var value: UIColor {
        get {
            switch self {
            case .red: return UIColor(red: 255, green: 58, blue: 48, alpha: 1)
            case .orange: return UIColor(red: 255, green: 149, blue: 0, alpha: 1)
            case .yellow: return UIColor(red: 255, green: 204, blue: 1, alpha: 1)
            case .green: return UIColor(red: 76, green: 217, blue: 100, alpha: 1)
            case .blue: return UIColor(red: 0, green: 122, blue: 255, alpha: 1)
            case .purple: return UIColor(red: 88, green: 86, blue: 214, alpha: 1)
            case .pink: return UIColor(red: 253, green: 92, blue: 99, alpha: 1)
            case .none: return UIColor(red: 255, green: 255, blue: 255, alpha: 0)
            }
        }
    }
}

// Return RGB values
extension UIColor {
    var redValue: CGFloat{ return CIColor(color: self).red }
    var greenValue: CGFloat{ return CIColor(color: self).green }
    var blueValue: CGFloat{ return CIColor(color: self).blue }
    var alphaValue: CGFloat{ return CIColor(color: self).alpha }
}

// Return UIColor from csv string
extension String {
    func colorFromCSV() -> UIColor {
        let rgbaValuesArray = description.components(separatedBy: ",").compactMap { CGFloat($0) }
        let red = rgbaValuesArray[0]
        let green = rgbaValuesArray[1]
        let blue = rgbaValuesArray[2]
        let alpha = rgbaValuesArray[3]
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension CGFloat {
    
    init?(_ string: String) {
        
        guard let number = NumberFormatter().number(from: string) else {
            return nil
        }
        
        self.init(number.floatValue)
    }
    
}
