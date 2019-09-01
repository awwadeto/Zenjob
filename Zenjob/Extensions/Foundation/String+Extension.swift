//
//  String+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

extension String {

  /// Converts currency name into symbole and removing decimal zeros
  var toCurrency: String {
    return self.replacingOccurrences(of: " EUR", with: "€").replacingOccurrences(of: ".00", with: "")
  }

  /// The double value representation of earning strings
  /// after removing the currency
  var doubleValue: Double? {
    return Double(self.replacingOccurrences(of: " EUR", with: ""))
  }

  /// Return the localized string
  var localized: String {
    return NSLocalizedString(self, comment: "")
  }

  /**
   Returns the localized string

   - parameter comment: Argument used for ease of translation when export localization files
   */
  func localized(withComment comment: String) -> String {
    return NSLocalizedString(self, comment: comment)
  }

}
