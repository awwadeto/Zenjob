//
//  GetOffersTask.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

/// GetOffersTask Perform a fetch request on the server and returns an array of Offers object
class GetOffersTask: Operation {

  // MARK: - Properites

  var offset: String
  var token: String

  var request: Request {
    return OfferRequests.offers(offset: offset, token: token)
  }

  // MARK: - Initialization


  /**
   Initialize a new GetOffersTask.
   - Parameters:
       - offset: Number of offers to skip
       - token: User token needed to authorize the request
   */
  init(offset: String, token: String) {
    self.offset = offset
    self.token = token
  }


  /**
   This function execute the get offers request and provide a completion handler with an array of offers as response.
   - Parameters:
   - dispatcher: network dispatcher to perform network requests
   - completion: completion handler with an array of offers onSuccess and an error onError
   */
  func execute(in dispatcher: Dispatcher, completion: @escaping ([Offer]?, Error?) -> Void) {
    do {
      try dispatcher.execute(request: self.request) { (response) in
        switch response {
        case .json(let data):
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .iso8601
          do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary

            if let total = jsonObject?["total"] as? Int {
              UserDefaults.standard.set(total, forKey: "totalJobs")
            }
            
            if let jsonOffers = jsonObject?["offers"] {
              let data = try JSONSerialization.data(withJSONObject: jsonOffers, options: .init(rawValue: 0))
              let offers = try decoder.decode([Offer].self, from: data)
              completion(offers, nil)
            }
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
