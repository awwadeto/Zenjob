//
//  LoginTask.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

class LoginTask: Operation {

  var username: String
  var password: String

  init(username: String, password: String) {
    self.username = username
    self.password = password
  }

  var request: Request {
    return UserRequests.login(username: self.username, password: self.password)
  }

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
