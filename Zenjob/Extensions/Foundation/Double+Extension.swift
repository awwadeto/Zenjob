//
//  Double+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

extension Double {

  /// Formats double value into a double decimaled string
  var toCurrency: String {
    return String(format: "%.2f€", self)
  }

}
