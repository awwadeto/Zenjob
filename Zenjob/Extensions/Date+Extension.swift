//
//  Date+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

extension Date {

  func toString(format: String = "EE. dd.MM") -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.dateFormat = format
    return formatter.string(from: self)
  }

  func timeIn24HourFormat() -> String {
    let formatter = DateFormatter()
    formatter.dateStyle = .none
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: self)
  }

}
