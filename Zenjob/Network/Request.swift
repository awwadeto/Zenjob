//
//  Request.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

public protocol Request {

  var path: String { get }

  var method: HTTPMethod { get }

  var parameters: RequestParams { get }

  var headers: [String: Any]? { get }

  var dataType: DataType { get }
}

public enum HTTPMethod: String {
  case post = "POST"
  case put = "PUT"
  case get = "GET"
  case delete = "DELETE"
}

public enum RequestParams {
  case body(_ : [String: Any]?)
  case url(_ : [String: Any]?)
}

public enum DataType {
  case JSON
  case Data
}
