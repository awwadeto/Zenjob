//
//  ExploreHeaderView.swift
//  Zenjob
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class ExploreHeaderView: UICollectionReusableView {

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .zenPurple
    label.font = UIFont.boldSystemFont(ofSize: 30)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()

  let jobsLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightG
    label.font = UIFont.systemFont(ofSize: 15)
    label.adjustsFontSizeToFitWidth = true
    label.minimumScaleFactor = 0.5
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .almostWhite
    self.addSubview(titleLabel)
    self.addSubview(jobsLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    NSLayoutConstraint.activate([
      titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
      titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),

      jobsLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      jobsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
      jobsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    fitSizes()
  }

  func populate() {
    fitSizes()
    titleLabel.text = "Explore jobs".localized
    let total = UserDefaults.standard.integer(forKey: "totalJobs")
    jobsLabel.text = String(format: NSLocalizedString("jobsNumber", comment: ""), "\(total)")
  }

  override func prepareForReuse() {
    titleLabel.text = nil
    jobsLabel.text = nil
  }

  private func fitSizes() {
    titleLabel.sizeToFit()
    jobsLabel.sizeToFit()
  }

}
