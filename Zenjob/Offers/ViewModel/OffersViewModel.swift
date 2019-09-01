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
  var offersTask: GetOffersTask

  var numberOfCells: Int {
    return offers.count
  }

  init(dispatcher: NetworkDispatcher, user: User) {
    self.dispatcher = dispatcher
    self.user = user
    self.offersTask = GetOffersTask(offset: "0", token: user.accessToken)
  }

  func fetchOffers(offset: String = "0", completion: @escaping () -> Void) {
    offersTask.offset = offset
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

      completion()
    }
  }

  func isMultipleShifts(row: Int) -> Bool {
    return offers[row].shifts.count > 1
  }

}
