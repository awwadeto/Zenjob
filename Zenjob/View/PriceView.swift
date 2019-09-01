//
//  PriceView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class PriceView: UIView {

  // MARK: - Properites

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  let summaryView: PriceDetailView = {
    let view = PriceDetailView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let pauseView: PriceDetailView = {
    let view = PriceDetailView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  let totalView: PriceDetailView = {
    let view = PriceDetailView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let line: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .lineG
    return view
  }()

  // MARK: - Initialization

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(titleLabel)
    self.addSubview(summaryView)
    self.addSubview(pauseView)
    self.addSubview(totalView)
    self.addSubview(line)

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
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),

      summaryView.leftAnchor.constraint(equalTo: self.leftAnchor),
      summaryView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
      summaryView.rightAnchor.constraint(equalTo: self.rightAnchor),
      summaryView.heightAnchor.constraint(equalTo: pauseView.heightAnchor),

      pauseView.leftAnchor.constraint(equalTo: self.leftAnchor),
      pauseView.topAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: 5),
      pauseView.rightAnchor.constraint(equalTo: self.rightAnchor),

      line.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      line.topAnchor.constraint(equalTo: pauseView.bottomAnchor, constant: 5),
      line.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      line.heightAnchor.constraint(equalToConstant: 1),

      totalView.leftAnchor.constraint(equalTo: self.leftAnchor),
      totalView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 5),
      totalView.rightAnchor.constraint(equalTo: self.rightAnchor),
      totalView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30),
      totalView.heightAnchor.constraint(equalTo: summaryView.heightAnchor)
      ])
  }

  /// Tells the delegate a layer's bounds have changed.
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    summaryView.sizeToFit()
    pauseView.sizeToFit()
    totalView.sizeToFit()
  }

  /// Populates the view's properties with an array of pricingTables
  func populate(pricingTables: [PricingTable]) {
    var amount: Double = 0.00
    titleLabel.text = "General details".localized

    for pricingTable in pricingTables {
      if let earningTotal = pricingTable.earningTotal.doubleValue {
        amount += earningTotal
      }

      if pricingTable.isSummary {
        summaryView.populate(pricingTable: pricingTable)
      }

      if !pricingTable.isSummary {
        pauseView.populate(pricingTable: pricingTable)
      }
    }

    totalView.populate(title: "Total".localized, amount: amount.toCurrency)
  }

}
