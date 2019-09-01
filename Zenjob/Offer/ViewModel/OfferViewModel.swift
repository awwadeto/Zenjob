//
//  OfferViewModel.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

class OfferViewModel {

  var reloadView: (()->())?
  var showAlert: (()->())?
  var dispatcher: NetworkDispatcher
  var user: User
  var offer: Offer
  var error: Error?
  var offerTask: GetOfferTask

  init(dispatcher: NetworkDispatcher, user: User, offer: Offer) {
    self.dispatcher = dispatcher
    self.user = user
    self.offer = offer
    self.offerTask = GetOfferTask(id: offer.id, token: user.accessToken)
  }

  func fetchOffer(completion: @escaping () -> Void) {
    offerTask.execute(in: dispatcher) { (offer, error) in

      if let error = error {
        self.error = error
        self.showAlert?()
        print("offerTask error: \(error.localizedDescription)")
      }

      if let offer = offer {
        self.offer = offer
        self.reloadView?()
      }

      completion()
    }
  }

}
