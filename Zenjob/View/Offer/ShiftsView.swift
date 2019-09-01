//
//  ShiftsView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class ShiftsView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

  // MARK: - Properites

  var shifts: [Shift] = []

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  var calendarButton: ZenButton = {
    let button = ZenButton(type: .empty, cornerRadius: 17)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  let collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumInteritemSpacing = 0
    flowLayout.minimumLineSpacing = 5
    flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .clear
    collectionView.register(ShiftCell.self, forCellWithReuseIdentifier: "shiftCell")
    return collectionView
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)

    collectionView.delegate = self
    collectionView.dataSource = self
    self.addSubview(titleLabel)
    self.addSubview(calendarButton)
    self.addSubview(collectionView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  /// Lays out subviews.
  override func layoutSubviews() {
    super.layoutSubviews()
    NSLayoutConstraint.activate([
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      titleLabel.heightAnchor.constraint(equalToConstant: 34),
      titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 2, constant: -30),

      calendarButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      calendarButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      calendarButton.heightAnchor.constraint(equalToConstant: 34),
      calendarButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 2, constant: -30),

      collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
      collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      ])
  }

  /// Tells the delegate a layer's bounds have changed.
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    collectionView.sizeToFit()
  }

  /// Populates the view's properties with an array of shifts
  func populate(shifts: [Shift]) {
    self.shifts = shifts
    titleLabel.text = "Shifts".localized
    calendarButton.setTitle("Add to calendar".localized, for: .normal)
    calendarButton.setTitle("Added to calendar".localized, for: .disabled)
    self.collectionView.reloadData()
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return shifts.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shiftCell", for: indexPath) as! ShiftCell
    cell.populate(shift: shifts[indexPath.row])
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: self.frame.width / 2.3, height: collectionView.frame.height - 15)
  }

}
