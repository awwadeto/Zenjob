//
//  OffersViewModel.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

class OffersViewModel {

  var reloadView: (()->())?
  var showAlert: (()->())?
  var dispatcher: NetworkDispatcher
  var user: User
  var offers: [Offer] = []
  var error: Error?

  var numberOfCells: Int {
    return offers.count
  }

  init(dispatcher: NetworkDispatcher, user: User) {
    self.dispatcher = dispatcher
    self.user = user
    self.fetchOffers()
  }

  func fetchOffers(offset: String = "0") {
    let offersTask = GetOffersTask(offset: offset, token: user.accessToken)
    offersTask.execute(in: dispatcher) { (offers, error) in

      if let error = error {
        self.error = error
        self.showAlert?()
        print("offersTask error: \(error.localizedDescription)")
      }

      if let offers = offers {
        if offset == "0" {
          self.offers.removeAll()
        }
        self.offers += offers
        self.reloadView?()
      }
    }
  }

  func isMultipleShifts(row: Int) -> Bool {
    return offers[row].shifts.count > 1
  }

}
