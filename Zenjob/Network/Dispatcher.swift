//
//  Dispatcher.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

public protocol Dispatcher {

  /// Configure the dispatcher with an environment
  ///
  /// - Parameter environment: environment configuration
  init(environment: Environment)


  /**
   This function execute the request and provide a completion handler with the response.
   - Parameters:
      - request: request to execute
      - completion: completion handler with the returned response
   */
  func execute(request: Request, completion: @escaping (_ response: Response) -> Void) throws

}
