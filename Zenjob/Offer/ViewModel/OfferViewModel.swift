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
  var dispatcher: NetworkDispatcher
  var user: User
  var offer: Offer

  init(dispatcher: NetworkDispatcher, user: User, offer: Offer) {
    self.dispatcher = dispatcher
    self.user = user
    self.offer = offer
    self.fetchOffer()
  }

  func fetchOffer() {
    let offerTask = GetOfferTask(id: offer.id, token: user.accessToken)
    offerTask.execute(in: dispatcher) { (offer, error) in

      if let error = error {
        print("offersTask error: \(error.localizedDescription)")
      }

      if let offer = offer {
        self.offer = offer
        self.reloadView?()
      }
    }
  }

}
