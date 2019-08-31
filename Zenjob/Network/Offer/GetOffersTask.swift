//
//  GetOffersTask.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

class GetOffersTask: Operation {

  var offset: String
  var token: String

  init(offset: String, token: String) {
    self.offset = offset
    self.token = token
  }

  var request: Request {
    return OfferRequests.offers(offset: offset, token: token)
  }

  func execute(in dispatcher: Dispatcher, completion: @escaping ([Offer]?, Error?) -> Void) {
    do {
      try dispatcher.execute(request: self.request) { (response) in
        switch response {
        case .json(let data):
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
          do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            let data = try JSONSerialization.data(withJSONObject: jsonObject!["offers"], options: .init(rawValue: 0))
            let offers = try decoder.decode([Offer].self, from: data)
            completion(offers, nil)
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
