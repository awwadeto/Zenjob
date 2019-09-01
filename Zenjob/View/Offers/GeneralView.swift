//
//  GeneralView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class GeneralView: UIView {

  // MARK: - Properites

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.numberOfLines = 2
    label.font = UIFont.boldSystemFont(ofSize: 18)
    return label
  }()

  let totalEarnLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  let hourlyEarnLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 14)
    label.layer.opacity = 0.8
    return label
  }()

  let generalLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.layer.masksToBounds = true
    self.addSubview(titleLabel)
    self.addSubview(totalEarnLabel)
    self.addSubview(hourlyEarnLabel)
    self.addSubview(generalLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  /// Lays out subviews.
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

      generalLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
      generalLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
      generalLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -10)
      ])
  }

  /// Tells the delegate a layer's bounds have changed.
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
    self.applyGradient(startColor: UIColor.random.cgColor, endColor: UIColor.random.cgColor)
  }

  /// Populates the view's properties with an offer
  func populate(offer: Offer) {
    fitSizes()
    titleLabel.text = offer.title
    totalEarnLabel.text = offer.earningTotal.toCurrency
    hourlyEarnLabel.text = String(format: NSLocalizedString("hourlyEarn", comment: ""), offer.earningHourly.toCurrency)
  }

  func transition(offer: Offer) {
    populate(offer: offer)
    generalLabel.text = "GENERAL".localized
  }

  /// Performs any clean up necessary to prepare the view for use again.
  func prepareForReuse() {
    titleLabel.text = nil
    totalEarnLabel.text = nil
    hourlyEarnLabel.text = nil
  }

  /// Resizes and moves the receiver views so it just encloses its subviews.
  private func fitSizes() {
    totalEarnLabel.sizeToFit()
    hourlyEarnLabel.sizeToFit()
    titleLabel.sizeToFit()
    generalLabel.sizeToFit()
  }

}
