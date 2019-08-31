//
//  OfferViewController.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit
import EventKit

class OfferViewController: UIViewController, UIScrollViewDelegate {

  var viewModel: OfferViewModel

  var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.contentInsetAdjustmentBehavior = .never
    return scrollView
  }()

  var generalView: GeneralView = {
    let view = GeneralView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let dismissButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor.darkG.withAlphaComponent(0.5)
    button.imageView?.contentMode = .scaleAspectFit
    button.setImage(UIImage(named: "x"), for: .normal)
    button.layer.cornerRadius = 15
    return button
  }()

  init(dispatcher: NetworkDispatcher, user: User, offer: Offer) {
    viewModel = OfferViewModel(dispatcher: dispatcher, user: user, offer: offer)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtons()
    setupView()
    populate()
    setupBindings()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    generalView.sizeToFit()
  }

  func setupBindings() {
    viewModel.reloadView = { [weak self] in
      DispatchQueue.main.async {
        self?.populate()
      }
    }
  }

  func populate() {
    generalView.populate(offer: viewModel.offer)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {

  }

  @objc func dimissView() {
    self.dismiss(animated: true, completion: nil)
  }

  func setupButtons() {
    dismissButton.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
  }

  func setupView() {
    self.view.backgroundColor = .almostWhite
    self.view.addSubview(scrollView)
    scrollView.delegate = self
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.distribution = .equalSpacing
    stackView.axis = .vertical
    scrollView.addSubview(stackView)
    scrollView.addSubview(dismissButton)
    stackView.addArrangedSubview(generalView)

    let constraints: [NSLayoutConstraint] = [
      scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),

      dismissButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -30),
      dismissButton.topAnchor.constraint(equalTo: scrollView.layoutMarginsGuide.topAnchor),
      dismissButton.heightAnchor.constraint(equalToConstant: 30),
      dismissButton.widthAnchor.constraint(equalToConstant: 30),

      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

      generalView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      generalView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1 / 3),

    ]

    NSLayoutConstraint.activate(constraints)
  }

}
