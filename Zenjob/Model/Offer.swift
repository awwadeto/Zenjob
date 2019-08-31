//
//  Offer.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

struct Offer: Codable {

  var id: String
  var jobMatchUuid: String
  var jobCategoryKey: String
  var title: String
  var description: String?
  var instructions: String?
  var companyName: String
  var companyLogoUrl: String
  var minutesSum: String
  var hourSum: String?
  var earningTotal: String
  var earningHourly: String
  var location: Location
  var breakTypes: [BreakType]
  var shifts: [Shift]
  var pricingTables: [PricingTable]

}
