//
//  String+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

extension String {

  var toCurrency: String {
    return self.replacingOccurrences(of: " EUR", with: "€").replacingOccurrences(of: ".00", with: "")
  }

  var doubleValue: Double? {
    return Double(self.replacingOccurrences(of: " EUR", with: ""))
  }

  /// return the localized string
  var localized: String {
    return NSLocalizedString(self, comment: "")
  }

  /**
   returns the localized string

   - parameter comment: Argument used for ease of translation when export localization files

   */
  func localized(withComment comment: String) -> String {
    return NSLocalizedString(self, comment: comment)
  }

}
