//
//  PlaceView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class PlaceView: UIView {

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  var mapButton: ZenButton = {
    let button = ZenButton(type: .empty, cornerRadius: 17)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private let locationView: LocationView = {
    let view = LocationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let locationLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.numberOfLines = 2
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()

  private let line: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lineG
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(titleLabel)
    self.addSubview(mapButton)
    self.addSubview(locationView)
    self.addSubview(locationLabel)
    self.addSubview(line)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      titleLabel.heightAnchor.constraint(equalToConstant: 34),
      titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 2, constant: -30),

      mapButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      mapButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      mapButton.heightAnchor.constraint(equalToConstant: 34),
      mapButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1 / 2, constant: -30),

      locationView.leftAnchor.constraint(equalTo: self.leftAnchor),
      locationView.rightAnchor.constraint(equalTo: self.rightAnchor),
      locationView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),

      locationLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      locationLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      locationLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      locationLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10),
      locationLabel.heightAnchor.constraint(equalTo: locationView.heightAnchor, multiplier: 1.5),

      line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      line.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 10),
      line.heightAnchor.constraint(equalToConstant: 1)
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    locationLabel.sizeToFit()
  }

  func populate(location: Location) {
    locationView.populate(location: location)
    locationLabel.text = location.locationSearchString
    titleLabel.text = "Place".localized
    mapButton.setTitle("View on maps".localized, for: .normal)
  }

}
