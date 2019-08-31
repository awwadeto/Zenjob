//
//  Environment.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

public struct Environment {

  public var name: String

  public var host: String

  public var headers: [String: Any] = [:]

  public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData

  public init(_ name: String, host: String) {
    self.name = name
    self.host = host
  }

}
