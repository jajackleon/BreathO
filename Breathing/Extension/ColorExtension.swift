//
//  ColorExtension.swift
//  Breathing
//
//  Created by Jackie Leonardy on 29/04/21.
//

import UIKit

extension UIColor{
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let frenchSkyBlue = UIColor.rgb(r: 108, g: 172, b: 252)
    static let babyBlueEyes = UIColor.rgb(r: 148, g: 196, b: 255)
    static let littleBoyBlue = UIColor.rgb(r: 79, g: 154, b: 247)
}
