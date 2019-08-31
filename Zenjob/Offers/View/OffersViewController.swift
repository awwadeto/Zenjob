//
//  OffersViewController.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class OffersViewController: UICollectionViewController {

  private let refreshControl = UIRefreshControl()
  var viewModel: OffersViewModel

  private let emptyStateMessage: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "No available offers. Pull to refresh"
    label.textColor = .darkGray
    label.numberOfLines = 0
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18)
    label.sizeToFit()
    return label
  }()

  init(dispatcher: NetworkDispatcher, user: User) {
    viewModel = OffersViewModel(dispatcher: dispatcher, user: user)

    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.minimumLineSpacing = 5
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    super.init(collectionViewLayout: flowLayout)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.title = "Explore jobs"
    self.view.backgroundColor = .white
    setupRefreshControl()
    setupCollectionView()
    setupBindings()
  }

  func setupRefreshControl() {
    refreshControl.tintColor = .zenPurple
    refreshControl.addTarget(self, action: #selector(refreshOffers), for: .valueChanged)
    refreshControl.attributedTitle = NSAttributedString(string: "Fetching Offers")
  }

  func setupCollectionView() {
    collectionView.backgroundColor = .white
    collectionView.showsVerticalScrollIndicator = false
    collectionView.refreshControl = refreshControl

  }

  func setupBindings() {
    viewModel.reloadView = { [weak self] in
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
      }
    }
  }

  @objc func refreshOffers() {
    viewModel.fetchOffers()
  }

  func showEmptyState() {
    collectionView.backgroundView = emptyStateMessage
  }

  func hideEmptyState() {
    collectionView.backgroundView = nil
  }

}
