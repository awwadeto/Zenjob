//
//  ApplyView.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class ApplyView: UIView {

  var applyButton: ZenButton = {
    let button = ZenButton(type: .full, cornerRadius: 30)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  var notButton: ZenButton = {
    let button = ZenButton(type: .empty, cornerRadius: 30)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)

    self.addSubview(applyButton)
    self.addSubview(notButton)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    NSLayoutConstraint.activate([
      applyButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      applyButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      applyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
      applyButton.heightAnchor.constraint(equalToConstant: 60),

      notButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
      notButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
      notButton.topAnchor.constraint(equalTo: applyButton.bottomAnchor, constant: 15),
      notButton.heightAnchor.constraint(equalToConstant: 60),
      notButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
      ])
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    applyButton.castShadow(radius: 9.0, opacity: 0.3, offsetWidth: 0, offsetHeight: 0)
  }

  func populate() {
    applyButton.setTitle("Apply now", for: .normal)
    notButton.setTitle("Not interested", for: .normal)
  }

}
