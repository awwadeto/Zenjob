//
//  UIViewController+Extension.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

extension UIViewController {
  func showAlert(error: Error) {
    let controller = UIAlertController(title: "Something went wrong".localized, message: error.localizedDescription, preferredStyle: .alert)
    present(controller, animated: true, completion: nil)
  }
}
