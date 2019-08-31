//
//  PricingTable.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

struct PricingTable: Codable {
  
  var isSummary: Bool
  var times: Int?
  var minutes: Int
  var name: String
  var unpaid: Bool
  var earningHourly: String
  var earningTotal: String
  
}
