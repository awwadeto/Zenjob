//
//  OffersViewModel.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

class OffersViewModel {

  // MARK: - Properites

  var reloadView: (()->())?
  var showAlert: (()->())?
  var dispatcher: Dispatcher
  var user: User
  var offers: [Offer] = []
  var error: Error?
  var offersTask: GetOffersTask

  var numberOfCells: Int {
    return offers.count
  }

  // MARK: - Initialization

  /**
   Initialize a new OffersViewModel.
   - Parameters:
     - dispatcher: Network dispatcher to perform network requests
     - user: The logged in user
   */
  init(dispatcher: Dispatcher, user: User) {
    self.dispatcher = dispatcher
    self.user = user
    self.offersTask = GetOffersTask(offset: "0", token: user.accessToken)
  }

  // MARK: - Methods

  /// Fetches user's offers
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


  /**
   Checks if the current offer has multiple shifts.
   - Parameter row: Index row of the wanted cell
   - Returns: Bool value of if the offer has multiple shifts or not
   */
  func isMultipleShifts(row: Int) -> Bool {
    return offers[row].shifts.count > 1
  }

}
