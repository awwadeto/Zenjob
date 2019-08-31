//
//  Int+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

extension Int {

  var toHours: String {
    let value = Double(self) / 60.0
    return value.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0fh", value) : String(format: "%.1fh", value)
  }

}
