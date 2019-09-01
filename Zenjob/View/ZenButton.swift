//
//  ZenButton.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit


/**
 Define the style of the ZenButton
 - full: colored background and without borders
 - empty: empty background and with borders
 */
enum CustomButtonType {
  case full
  case empty
}

/// Custom implementation of UIButton with different button styles
class ZenButton: UIButton {

  // MARK: - Properites

  var type: CustomButtonType

  override var isEnabled: Bool {
    didSet {
      switch type {
      case .full:
        self.setTitleColor(.white, for: .normal)
        self.setTitleColor(.white, for: .disabled)
        self.backgroundColor = isEnabled ? UIColor.zenPurple : UIColor.darkG
      case .empty:
        self.setTitleColor(.zenPurple, for: .normal)
        self.setTitleColor(.darkG, for: .disabled)
        self.layer.borderColor = isEnabled ? UIColor.zenPurple.cgColor : UIColor.darkG.cgColor
      }
    }
  }

  // MARK: - Initialization


  /**
   Initialize a new ZenButton with custom style.
   - Parameters:
       - type: the style type of the button
       - cornerRadius: the radius of the button corners
   */
  init(type: CustomButtonType, cornerRadius: CGFloat) {
    self.type = type
    super.init(frame: .zero)
    applyStyle(cornerRadius: cornerRadius)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Methods

  /// Applying button styles
  /// - Parameter cornerRadius: the radius of the button corners
  func applyStyle(cornerRadius: CGFloat) {
    self.layer.cornerRadius = cornerRadius
    self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    self.titleLabel?.adjustsFontSizeToFitWidth = true
    self.titleLabel?.minimumScaleFactor = 0.5
    self.layer.masksToBounds = true
    switch type {
    case .full:
      self.backgroundColor = UIColor.zenPurple
      self.setTitleColor(.white, for: .normal)
      self.castShadow(radius: 9.0, opacity: 0.3, offsetWidth: 0, offsetHeight: 0)
    case .empty:
      self.setTitleColor(.zenPurple, for: .normal)
      self.layer.borderWidth = 1
      self.layer.borderColor = UIColor.zenPurple.cgColor
    }
  }

}
