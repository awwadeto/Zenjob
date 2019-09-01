//
//  Operation.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

protocol Operation {

  associatedtype Output

  /// Request to execute
  var request: Request { get }

  /**
   This function execute the request and provide a completion handler with the response.
   - Parameters:
      - dispatcher: network dispatcher to perform network requests
      - completion: completion handler with onSuccess and onError statuses
   */
  func execute(in dispatcher: Dispatcher, completion: @escaping (_ onSuccess: Output?, _ onError: Error?) -> Void)

}
