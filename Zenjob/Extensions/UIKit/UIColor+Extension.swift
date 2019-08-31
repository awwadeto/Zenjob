//
//  UIColor+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension UIColor {

  static let almostWhite = UIColor(red: 0.980, green: 0.980, blue: 0.980, alpha: 1.00)
  static let zenPurple = UIColor(red: 0.290, green: 0.149, blue: 0.592, alpha: 1.0)
  static let darkG = UIColor(red: 0.314, green: 0.325, blue: 0.365, alpha: 1.0)
  static let lightG = UIColor(red: 0.631, green: 0.651, blue: 0.690, alpha: 1.00)
  static let zenPink = UIColor(red: 0.980, green: 0.271, blue: 0.451, alpha: 1.0)
  static let lineG =  UIColor(red: 0.880, green: 0.880, blue: 0.880, alpha: 1.00)

  class var random: UIColor {
    return UIColor(red: .random(), green: .random(), blue:  .random(), alpha: 1.0)
  }
}
