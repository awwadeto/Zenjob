//
//  LoginTask.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

/// LoginTask Perform a login request on the server and returns a User object
class LoginTask: Operation {

  // MARK: - Properites

  var username: String
  var password: String

  var request: Request {
    return UserRequests.login(username: self.username, password: self.password)
  }

  // MARK: - Initialization

  init(username: String, password: String) {
    self.username = username
    self.password = password
  }


  /**
   This function execute the login request and provide a completion handler with a user as response.
   - Parameters:
   - dispatcher: network dispatcher to perform network requests
   - completion: completion handler with a user onSuccess and an error onError
   */
  func execute(in dispatcher: Dispatcher, completion: @escaping (User?, Error?) -> Void) {
    do {
      try dispatcher.execute(request: self.request) { (response) in
        switch response {
        case .json(let data):
          let decoder = JSONDecoder()
          do {
            let user = try decoder.decode(User.self, from: data)
            completion(user, nil)
          } catch {
            print("Failed to decode JSON")
            completion(nil, error)
          }
        case .data(_):
          break
        case .error(_, let error):
          completion(nil, error)
        }
      }
    } catch {
      completion(nil, error)
    }
  }
}
