//
//  GeneralView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class GeneralView: UIView {

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.numberOfLines = 2
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()

  private let totalEarnLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  private let hourlyEarnLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    label.layer.opacity = 0.8
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.layer.masksToBounds = true
    self.addSubview(titleLabel)
    self.addSubview(totalEarnLabel)
    self.addSubview(hourlyEarnLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    NSLayoutConstraint.activate([
      totalEarnLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      totalEarnLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
      totalEarnLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),

      hourlyEarnLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      hourlyEarnLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
      hourlyEarnLabel.topAnchor.constraint(equalTo: totalEarnLabel.bottomAnchor, constant: 5),

      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
      titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
    self.applyGradient(startColor: UIColor.random.cgColor, endColor: UIColor.random.cgColor)
  }

  func populate(offer: Offer) {
    fitSizes()
    titleLabel.text = offer.title
    totalEarnLabel.text = offer.earningTotal.toCurrency
    hourlyEarnLabel.text = "\(offer.earningHourly.toCurrency) per hour"
  }

  func prepareForReuse() {
    titleLabel.text = nil
    totalEarnLabel.text = nil
    hourlyEarnLabel.text = nil
  }

  private func fitSizes() {
    totalEarnLabel.sizeToFit()
    hourlyEarnLabel.sizeToFit()
    titleLabel.sizeToFit()
  }

}
