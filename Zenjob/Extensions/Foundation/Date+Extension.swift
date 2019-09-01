//
//  Date+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

extension Date {


  /**
   Format a date.

   - Parameter format: The style of date wanted
   - Returns: A formatted date as string
   */
  func toString(format: String = "EE. dd.MM") -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = format
    return formatter.string(from: self)
  }

  /// Returns date as a time in 24 hours format string.
  func timeIn24HourFormat() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: self)
  }

  /// Returns short formatted day string.
  var day: String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = "EE"
    return formatter.string(from: self)
  }

}
