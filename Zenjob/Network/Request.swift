//
//  Request.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

public protocol Request {

  /// Relative path of the endpoint to call
  var path: String { get }

  /// HTTP method we should use to perform the call
  var method: HTTPMethod { get }

  /// The parameters we need to send along with the call
  var parameters: RequestParams { get }

  /// The headers we need to send along with the call
  var headers: [String: Any]? { get }

  /// Expected response type
  var dataType: DataType { get }
}


/**
 HTTP method types used to perform the request
*/
public enum HTTPMethod: String {
  case post = "POST"
  case put = "PUT"
  case get = "GET"
  case delete = "DELETE"
}


/// Define parameters to pass along with the request and how
///they are encapsulated into the http request itself.
public enum RequestParams {
  case body(_ : [String: Any]?)
  case url(_ : [String: Any]?)
}


/**
 Define the type of data we expect as response
  - JSON: json representation of the response
  - Data: data representation of the response
*/
public enum DataType {
  case JSON
  case Data
}
