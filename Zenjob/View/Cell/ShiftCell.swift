//
//  ShiftCell.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class ShiftCell: UICollectionViewCell {

  // MARK: - Properites

  private let cardView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 12
    view.backgroundColor = .white
    view.layer.borderColor = UIColor.lineG.cgColor
    view.layer.borderWidth = 1
    return view
  }()

  let dayLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .red
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()

  let dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .darkG
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 20)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()

  let timeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 14)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()

  // MARK: - Initialization

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(cardView)
    cardView.addSubview(dayLabel)
    cardView.addSubview(dateLabel)
    cardView.addSubview(timeLabel)

  }

  // MARK: - Methods

  /// Lays out subviews.
  override func layoutSubviews() {
    super.layoutSubviews()
    NSLayoutConstraint.activate([
      cardView.leftAnchor.constraint(equalTo: self.leftAnchor),
      cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
      cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),

      dayLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5),
      dayLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5),
      dayLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),

      dateLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5),
      dateLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5),
      dateLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 5),
      dateLabel.heightAnchor.constraint(equalTo: dayLabel.heightAnchor),

      timeLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 5),
      timeLabel.rightAnchor.constraint(equalTo: cardView.rightAnchor, constant: -5),
      timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
      timeLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
      timeLabel.heightAnchor.constraint(equalTo: dateLabel.heightAnchor),
      ])
  }

  /// Populates the view's properties with a shift
  func populate(shift: Shift) {
    dayLabel.text = shift.beginDate.day
    dateLabel.text = shift.beginDate.toString(format: "dd.MM")
    timeLabel.text = "\(shift.beginDate.timeIn24HourFormat()) - \(shift.endDate.timeIn24HourFormat())"
  }

  /// Tells the delegate a layer's bounds have changed.
  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
  }

  /// Performs any clean up necessary to prepare the view for use again.
  override func prepareForReuse() {
    super.prepareForReuse()
    dayLabel.text = nil
    dateLabel.text = nil
    dateLabel.text = nil
  }

}

