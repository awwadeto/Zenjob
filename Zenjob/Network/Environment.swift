//
//  Environment.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

/// Environment is a struct which encapsulate all the informations
/// we need to perform a setup of our Networking Layer.
public struct Environment {

  /// Name of the environment
  public var name: String

  /// Base URL of the environment
  public var host: String

  public var headers: [String: Any] = [:]

  /// Cache policy
  public var cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData


  /**
   Initialize a new Environment

   - Parameters:
      - name: name of the environment
      - host: base url
   */
  public init(_ name: String, host: String) {
    self.name = name
    self.host = host
  }

}
