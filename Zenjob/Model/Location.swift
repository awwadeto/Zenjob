//
//  Location.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

struct Location: Codable {

  var city: String?
  var district: String?
  var locationDisplayName: String
  var locationLatitude: Double?
  var locationLongitude: Double?
  var locationName: String
  var locationSearchString: String?
  var postalCode: String?
  var street: String?
  var streetNumber: String?
  var supplementary: String?

}
