//
//  LocationView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class LocationView: UIView {

  private let cityLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()

  private let districtLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  private let locationIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.layer.masksToBounds = true
    self.addSubview(cityLabel)
    self.addSubview(districtLabel)
    self.addSubview(locationIcon)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      locationIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      locationIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
      locationIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      locationIcon.widthAnchor.constraint(equalTo: locationIcon.heightAnchor),

      districtLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      districtLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      districtLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),

      cityLabel.leftAnchor.constraint(equalTo: locationIcon.rightAnchor, constant: 10),
      cityLabel.rightAnchor.constraint(equalTo: districtLabel.leftAnchor, constant: 10),
      cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
      cityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
  }

  func populate(location: Location) {
    fitSizes()
    districtLabel.text = location.district ?? "District"
    cityLabel.text = location.city ?? "City"
    locationIcon.image = UIImage(named: "pin")
  }

  private func fitSizes() {
    districtLabel.sizeToFit()
    cityLabel.sizeToFit()
  }

  func prepareForReuse() {
    districtLabel.text = nil
    cityLabel.text = nil
  }

}
