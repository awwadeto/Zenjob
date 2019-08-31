//
//  MultipleShiftsCell.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class MultipleShiftsCell: UICollectionViewCell {

  private let cardView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 12
    view.backgroundColor = .white
    return view
  }()

  private let generalView: GeneralView = {
    let view = GeneralView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 12
    view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    return view
  }()

  private let locationView: LocationView = {
    let view = LocationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let shiftsView: MultipleShiftsView = {
    let view = MultipleShiftsView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let detailView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 12
    view.backgroundColor = .white
    view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    return view
  }()

  private let line: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lineG
    return view
  }()

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.contentView.addSubview(cardView)
    cardView.addSubview(generalView)
    cardView.addSubview(detailView)
    cardView.addSubview(line)
    detailView.addSubview(locationView)
    detailView.addSubview(shiftsView)

  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

      generalView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
      generalView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
      generalView.topAnchor.constraint(equalTo: cardView.topAnchor),
      generalView.heightAnchor.constraint(equalTo: cardView.heightAnchor, multiplier: 3/5),

      detailView.leftAnchor.constraint(equalTo: cardView.leftAnchor),
      detailView.rightAnchor.constraint(equalTo: cardView.rightAnchor),
      detailView.topAnchor.constraint(equalTo: generalView.bottomAnchor),
      detailView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),

      locationView.leftAnchor.constraint(equalTo: detailView.leftAnchor),
      locationView.rightAnchor.constraint(equalTo: detailView.rightAnchor),
      locationView.topAnchor.constraint(equalTo: detailView.topAnchor),
      locationView.bottomAnchor.constraint(equalTo: detailView.centerYAnchor, constant: -20),

      shiftsView.leftAnchor.constraint(equalTo: detailView.leftAnchor),
      shiftsView.rightAnchor.constraint(equalTo: detailView.rightAnchor),
      shiftsView.bottomAnchor.constraint(equalTo: detailView.bottomAnchor),
      shiftsView.topAnchor.constraint(equalTo: detailView.centerYAnchor, constant: -20),

      line.leftAnchor.constraint(equalTo: detailView.leftAnchor, constant: 20),
      line.rightAnchor.constraint(equalTo: detailView.rightAnchor, constant: -20),
      line.centerYAnchor.constraint(equalTo: detailView.centerYAnchor, constant: -20),
      line.heightAnchor.constraint(equalToConstant: 1)
      ])
  }

  func populate(offer: Offer) {
    generalView.populate(offer: offer)
    locationView.populate(location: offer.location)
    shiftsView.populate(shifts: offer.shifts)
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    cardView.castShadow(radius: 8.0, opacity: 0.5, offsetWidth: 0, offsetHeight: 6)
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    generalView.prepareForReuse()
    locationView.prepareForReuse()
    shiftsView.prepareForReuse()
  }

}
