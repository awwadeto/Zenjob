//
//  DescriptionView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class DescriptionView: UIView {

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  private let descriptionDetails: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()

  private let instructionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 16)
    return label
  }()

  private let instructionDetails: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 16)
    label.textAlignment = .right
    return label
  }()

  private var instructionView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 12
    view.backgroundColor = .white
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(titleLabel)
    self.addSubview(descriptionDetails)
    self.addSubview(instructionView)
    instructionView.addSubview(instructionLabel)
    instructionView.addSubview(instructionDetails)
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
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),

      descriptionDetails.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      descriptionDetails.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      descriptionDetails.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),

      instructionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      instructionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      instructionView.topAnchor.constraint(equalTo: descriptionDetails.bottomAnchor, constant: 15),
      instructionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),

      instructionLabel.leftAnchor.constraint(equalTo: instructionView.leftAnchor, constant: 20),
      instructionLabel.topAnchor.constraint(equalTo: instructionView.topAnchor, constant: 15),
      instructionLabel.heightAnchor.constraint(equalToConstant: 20),
      instructionLabel.rightAnchor.constraint(equalTo: instructionView.rightAnchor, constant: -20),

      instructionDetails.leftAnchor.constraint(equalTo: instructionView.leftAnchor, constant: 20),
      instructionDetails.rightAnchor.constraint(equalTo: instructionView.rightAnchor, constant: -20),
      instructionDetails.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 15),
      instructionDetails.bottomAnchor.constraint(equalTo: instructionView.bottomAnchor, constant: -15),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    instructionView.sizeToFit()
    descriptionDetails.sizeToFit()
    instructionDetails.sizeToFit()
    instructionView.castShadow(radius: 10.0, opacity: 0.3, offsetWidth: 0, offsetHeight: 0)
  }

  func populate(offer: Offer) {
    titleLabel.text = "Description"
    descriptionDetails.text = offer.description ?? "No available description"
    instructionLabel.text = "Requirements & Instructions"
    instructionDetails.text = offer.instructions ?? "No available instructions"
  }

}
