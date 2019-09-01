//
//  Offers+Helper.swift
//  Zenjob
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension OffersViewController {

  /// Fetch offers from offset '0'
  @objc func refreshOffers() {
    viewModel.fetchOffers(completion: { [weak self] in
      DispatchQueue.main.async {
        self?.refreshControl.endRefreshing()
      }
    })
  }

  func showEmptyState() {
    collectionView.backgroundView = emptyStateMessage
  }

  func hideEmptyState() {
    collectionView.backgroundView = nil
  }

}
