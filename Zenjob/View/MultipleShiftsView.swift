//
//  MultipleShiftsView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class MultipleShiftsView: UIView {

  private let startDateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()

  private let startTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  private let startTimeIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private let endDateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()

  private let endTimeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  private let endTimeIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private let shiftsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  private let line: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .zenPurple
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.layer.masksToBounds = true
    self.addSubview(startDateLabel)
    self.addSubview(startTimeLabel)
    self.addSubview(startTimeIcon)
    self.addSubview(endDateLabel)
    self.addSubview(endTimeLabel)
    self.addSubview(endTimeIcon)
    self.addSubview(shiftsLabel)
    self.addSubview(line)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      startTimeIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      startTimeIcon.centerYAnchor.constraint(equalTo: startTimeLabel.centerYAnchor),
      startTimeIcon.heightAnchor.constraint(equalToConstant: 15),
      startTimeIcon.widthAnchor.constraint(equalTo: startTimeIcon.heightAnchor),

      startTimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      startTimeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      startTimeLabel.bottomAnchor.constraint(equalTo: shiftsLabel.topAnchor, constant: -10),

      startDateLabel.leftAnchor.constraint(equalTo: startTimeIcon.rightAnchor, constant: 10),
      startDateLabel.rightAnchor.constraint(equalTo: startTimeLabel.leftAnchor, constant: -10),
      startDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

      shiftsLabel.leftAnchor.constraint(equalTo: startTimeIcon.rightAnchor, constant: 10),
      shiftsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      shiftsLabel.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 10),
      shiftsLabel.bottomAnchor.constraint(equalTo: endDateLabel.topAnchor, constant: -10),

      line.centerXAnchor.constraint(equalTo: startTimeIcon.centerXAnchor),
      line.widthAnchor.constraint(equalToConstant: 1),
      line.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 4),
      line.bottomAnchor.constraint(equalTo: endDateLabel.topAnchor, constant: -4),

      endTimeIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      endTimeIcon.centerYAnchor.constraint(equalTo: endTimeLabel.centerYAnchor),
      endTimeIcon.heightAnchor.constraint(equalToConstant: 15),
      endTimeIcon.widthAnchor.constraint(equalTo: endTimeIcon.heightAnchor),

      endTimeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      endTimeLabel.topAnchor.constraint(equalTo: shiftsLabel.bottomAnchor, constant: 10),
      endTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),

      endDateLabel.leftAnchor.constraint(equalTo: endTimeIcon.rightAnchor, constant: 10),
      endDateLabel.rightAnchor.constraint(equalTo: endTimeLabel.leftAnchor, constant: -10),
      endDateLabel.topAnchor.constraint(equalTo: shiftsLabel.bottomAnchor, constant: 10),
      endDateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
  }

  func populate(shifts: [Shift]) {
    fitSizes()
    startTimeIcon.image = UIImage(named: "clock")
    endTimeIcon.image = UIImage(named: "clock")
  }

  private func fitSizes() {
  }

  func prepareForReuse() {
    startDateLabel.text = nil
    startTimeLabel.text = nil
    endDateLabel.text = nil
    endTimeLabel.text = nil
    shiftsLabel.text = nil
  }

}
