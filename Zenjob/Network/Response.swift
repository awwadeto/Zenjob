//
//  Response.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

public enum Response {
  case json(_: Data)
  case data(_: Data)
  case error(_: Int?, _: Error?)

  init(_ response: (response: HTTPURLResponse?, data: Data?, error: Error?), for request: Request) {
    guard response.response?.statusCode == 200, response.error == nil else {
      self = .error(response.response?.statusCode, response.error)
      return
    }

    guard let data = response.data else {
      self = .error(response.response?.statusCode, NetworkErrors.noData)
      return
    }

    switch request.dataType {
    case .Data:
      self = .data(data)
    case .JSON:
      self = .json(data)
    }
  }
}
