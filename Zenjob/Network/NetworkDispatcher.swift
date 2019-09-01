//
//  NetworkDispatcher.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation


/**
 Define the type of error we expect from the network
 - badInput: invoke for wrong data in the request parameters
 - Data: invoke when no data returned with the response
 */
public enum NetworkErrors: Error {
  case badInput
  case noData
}

public class NetworkDispatcher: Dispatcher {

  private var environment: Environment
  private var session: URLSession

  
  /**
   Initialize a new NetworkDispatcher
   - Parameter environment: environment instance with name and host
   */
  required public init(environment: Environment) {
    self.environment = environment
    self.session = URLSession(configuration: URLSessionConfiguration.default)
  }


  /**
   This function execute the request and provide a completion handler with the response.
   - Parameters:
      - request: request to execute
      - completion: completion handler with onSuccess and onError statuses
   */
  public func execute(request: Request, completion: @escaping (Response) -> Void) throws {
    let req = try prepareURLRequest(for: request)
    let dataTask = session.dataTask(with: req, completionHandler: { (data, urlResponse, error) in
      let response = Response((urlResponse as? HTTPURLResponse, data, error), for: request)
      completion(response)
    })
    dataTask.resume()
  }


  /**
   This function execute the request and provide a completion handler with the response.
   - Parameter request: request to execute
   - Returns: A URLRequest generated from the request parameter
   */
  private func prepareURLRequest(for request: Request) throws -> URLRequest {
    let url = "\(environment.host)\(request.path)"
    var urlRequest = URLRequest(url: URL(string: url)!)
    urlRequest.cachePolicy = environment.cachePolicy
    urlRequest.httpMethod = request.method.rawValue
    if let headers = request.headers {
      for header in headers {
        urlRequest.addValue(header.value as! String, forHTTPHeaderField: header.key)
      }
    }

    switch request.parameters {
    case .body(let params):
      if let params = params as NSDictionary? {
        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: .init(rawValue: 0))
      } else {
        throw NetworkErrors.badInput
      }
    case .url(let params):
      if let params = params as NSDictionary? {
        let queryItems = params.map({ (element) -> URLQueryItem in
          return URLQueryItem(name: element.key as! String, value: element.value as? String)
        })
        guard var components = URLComponents(string: url) else {
          throw NetworkErrors.badInput
        }

        components.queryItems = queryItems
        if queryItems.count > 0 {
          urlRequest.url = components.url
        }

      } else {
        throw NetworkErrors.badInput
      }
    }
    return urlRequest
  }

  public func setSession(session: URLSession) {
    self.session = session
  }

}
