//
//  Offers+CollectionView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension OffersViewController: UICollectionViewDelegateFlowLayout {

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if viewModel.numberOfCells == 0 {
      showEmptyState()
    } else {
      hideEmptyState()
    }
    return viewModel.numberOfCells
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.row == viewModel.numberOfCells - 1 {
      viewModel.fetchOffers(offset: String(viewModel.numberOfCells), completion: { })
    }

    if viewModel.isMultipleShifts(row: indexPath.row) {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "multipleCell", for: indexPath) as! MultipleShiftsCell
      cell.populate(offer: viewModel.offers[indexPath.row])
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "singleCell", for: indexPath) as! SingleShiftCell
      cell.populate(offer: viewModel.offers[indexPath.row])
      return cell
    }
  }

  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let controller = OfferViewController(dispatcher: viewModel.dispatcher, user: viewModel.user, offer: viewModel.offers[indexPath.row])
    self.present(controller, animated: true, completion: nil)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if viewModel.isMultipleShifts(row: indexPath.row) {
      return CGSize(width: self.view.frame.width, height: 400.0)
    }
    return CGSize(width: self.view.frame.width, height: 300.0)
  }

}
