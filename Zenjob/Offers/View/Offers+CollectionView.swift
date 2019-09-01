//
//  Offers+CollectionView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension OffersViewController: UICollectionViewDelegateFlowLayout {

  /// Asks your data source object for the number of items in the specified section.
  /// And shows or hide the EmptyState
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if viewModel.numberOfCells == 0 {
      showEmptyState()
    } else {
      hideEmptyState()
    }
    return viewModel.numberOfCells
  }

  /// Asks your data source object for the cell that corresponds to
  /// the specified item in the collection view.
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

  /// Tells the delegate that the item at the specified index path was selected.
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let controller = OfferViewController(dispatcher: viewModel.dispatcher, user: viewModel.user, offer: viewModel.offers[indexPath.row])
    self.present(controller, animated: true, completion: nil)
  }

  /// Asks the delegate for the size of the specified item’s cell,
  /// depending on if the offer has mutiple shifts or not
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if viewModel.isMultipleShifts(row: indexPath.row) {
      return CGSize(width: self.view.frame.width, height: 400.0)
    }
    return CGSize(width: self.view.frame.width, height: 300.0)
  }

}
