//
//  PriceDetailView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class PriceDetailView: UIView {

  private let typeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()

  private let hourlyLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  private let amountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(typeLabel)
    self.addSubview(hourlyLabel)
    self.addSubview(amountLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      typeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      typeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      typeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

      amountLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      amountLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

      hourlyLabel.rightAnchor.constraint(equalTo: amountLabel.leftAnchor, constant: -10),
      hourlyLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      hourlyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
  }

  func populate(pricingTable: PricingTable) {
    fitSizes()

    typeLabel.text = pricingTable.minutes >= 60 ? "\(pricingTable.minutes.toHours) \(pricingTable.name)" : "\(pricingTable.minutes) min \(pricingTable.name)"

    if let earningTotal = pricingTable.earningTotal.doubleValue {
      amountLabel.text = earningTotal.toCurrency
    }

    if let earningHourly = pricingTable.earningHourly.doubleValue {
      hourlyLabel.text = "(\(earningHourly.toCurrency))/h"
    }
  }

  func populate(title: String, amount: String) {
    fitSizes()
    typeLabel.text = title
    amountLabel.text = amount
  }

  private func fitSizes() {
    typeLabel.sizeToFit()
    amountLabel.sizeToFit()
    hourlyLabel.sizeToFit()
  }

  func prepareForReuse() {
    typeLabel.text = nil
    amountLabel.text = nil
    hourlyLabel.text = nil
  }
}
