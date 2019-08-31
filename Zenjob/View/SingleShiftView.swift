//
//  SingleShiftView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class SingleShiftView: UIView {

  private let dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    return label
  }()

  private let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.textAlignment = .right
    return label
  }()

  private let timeIcon: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.layer.masksToBounds = true
    self.addSubview(dateLabel)
    self.addSubview(timeLabel)
    self.addSubview(timeIcon)

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      timeIcon.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      timeIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
      timeIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
      timeIcon.widthAnchor.constraint(equalTo: timeIcon.heightAnchor),

      timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      timeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),

      dateLabel.leftAnchor.constraint(equalTo: timeIcon.rightAnchor, constant: 10),
      dateLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor, constant: -10),
      dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
      dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
  }

  func populate(shifts: [Shift]) {
    fitSizes()
    dateLabel.text = shifts.first?.beginDate.toString()

    if let beginDate = shifts.first?.beginDate , let endDate = shifts.first?.endDate {
      timeLabel.text = "\(beginDate.timeIn24HourFormat()) - \(endDate.timeIn24HourFormat())"
    }

    timeIcon.image = UIImage(named: "clock")
  }

  private func fitSizes() {
    dateLabel.sizeToFit()
    timeLabel.sizeToFit()
  }

  func prepareForReuse() {
    dateLabel.text = nil
    timeLabel.text = nil
  }

}
