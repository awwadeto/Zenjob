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

}
