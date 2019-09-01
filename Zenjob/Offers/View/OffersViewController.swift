//
//  OffersViewController.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class OffersViewController: UICollectionViewController {

  // MARK: - Properites

  private let refreshControl = UIRefreshControl()
  var viewModel: OffersViewModel

  private let emptyStateMessage: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "No available offers. Pull to refresh".localized
    label.textColor = .darkGray
    label.numberOfLines = 0
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18)
    label.sizeToFit()
    return label
  }()

  // MARK: - Initialization

  /**
   Initialize a new OffersViewController.
   - Parameters:
   - dispatcher: Network dispatcher to perform network requests
   - user: The logged in user
   */
  init(dispatcher: NetworkDispatcher, user: User) {
    viewModel = OffersViewModel(dispatcher: dispatcher, user: user)
    viewModel.fetchOffers(completion: {})

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

  // MARK: - Methods

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Explore jobs".localized
    self.view.backgroundColor = .white
    setupRefreshControl()
    setupCollectionView()
    setupBindings()
  }

  /// Set up refresh controller
  func setupRefreshControl() {
    refreshControl.tintColor = .zenPurple
    refreshControl.addTarget(self, action: #selector(refreshOffers), for: .valueChanged)
    refreshControl.attributedTitle = NSAttributedString(string: "Fetching Offers".localized)
  }

  /// Set up collection view
  func setupCollectionView() {
    collectionView.backgroundColor = .white
    collectionView.showsVerticalScrollIndicator = false
    collectionView.refreshControl = refreshControl
    collectionView.register(SingleShiftCell.self, forCellWithReuseIdentifier: "singleCell")
    collectionView.register(MultipleShiftsCell.self, forCellWithReuseIdentifier: "multipleCell")
  }

  func setupBindings() {
    viewModel.reloadView = { [weak self] in
      DispatchQueue.main.async {
        self?.collectionView.reloadData()
      }
    }

    viewModel.showAlert = { [weak self] in
      DispatchQueue.main.async {
        if let error = self?.viewModel.error {
          self?.showAlert(error: error)
        }
      }
    }
  }

  /// Fetch offers from offset '0'
  @objc func refreshOffers() {
    viewModel.fetchOffers(completion: { })
  }

  func showEmptyState() {
    collectionView.backgroundView = emptyStateMessage
  }

  func hideEmptyState() {
    collectionView.backgroundView = nil
  }

}
