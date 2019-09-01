//
//  GetOfferTask.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

/// GetOfferTask Perform a fetch request on the server and returns an Offer object
class GetOfferTask: Operation {

  // MARK: - Properites

  var id: String
  var token: String
  
  var request: Request {
    return OfferRequests.offer(id: self.id, token: self.token)
  }

  // MARK: - Initialization

  init(id: String, token: String) {
    self.id = id
    self.token = token
  }


  /**
   This function execute the get offers request and provide a completion handler with an offer as response.
   - Parameters:
   - dispatcher: network dispatcher to perform network requests
   - completion: completion handler with an offer onSuccess and an error onError
   */
  func execute(in dispatcher: Dispatcher, completion: @escaping (Offer?, Error?) -> Void) {
    do {
      try dispatcher.execute(request: self.request) { (response) in
        switch response {
        case .json(let data):
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
          do {
            let offer = try decoder.decode(Offer.self, from: data)
            completion(offer, nil)
          } catch {
            print("Failed to decode JSON")
            print("error \(error.localizedDescription)")
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
