//
//  User.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

struct User: Codable {

  var username: String
  var accessToken: String
  var refreshToken: String
  var expiry: Int

  enum CodingKeys: String, CodingKey {
    case username
    case accessToken = "access_token"
    case refreshToken = "refresh_token"
    case expiry = "expires_in"
  }

}
