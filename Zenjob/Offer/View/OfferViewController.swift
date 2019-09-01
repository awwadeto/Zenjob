//
//  OfferViewController.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit

class OfferViewController: UIViewController, UIScrollViewDelegate {

  // MARK: - Properites

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

  var priceView: PriceView = {
    let view = PriceView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var shiftsView: ShiftsView = {
    let view = ShiftsView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var placeView: PlaceView = {
    let view = PlaceView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var descriptionView: DescriptionView = {
    let view = DescriptionView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  var applyView: ApplyView = {
    let view = ApplyView()
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

  // MARK: - Initialization

  /**
   Initialize a new OfferViewController.
   - Parameters:
       - dispatcher: Network dispatcher to perform network requests
       - user: The logged in user
       - offer: The offer picked by the user
   */
  init(dispatcher: Dispatcher, user: User, offer: Offer) {
    viewModel = OfferViewModel(dispatcher: dispatcher, user: user, offer: offer)
    viewModel.fetchOffer(completion: {})
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    print("============= Deinit \(self) =============")
  }

  // MARK: - Methods

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
    priceView.sizeToFit()
    shiftsView.sizeToFit()
    placeView.sizeToFit()
    descriptionView.sizeToFit()
    applyView.sizeToFit()
  }

  func setupBindings() {
    viewModel.reloadView = { [weak self] in
      DispatchQueue.main.async {
        self?.populate()
      }
    }
    
    viewModel.showAlert = { [weak self] in
      DispatchQueue.main.async {
        if let error = self?.viewModel.error {
          self?.showAlert(error: error)
        }
      }
    }
  }

  /// Populates the view's properties
  func populate() {
    generalView.transition(offer: viewModel.offer)
    priceView.populate(pricingTables: viewModel.offer.pricingTables)
    shiftsView.populate(shifts: viewModel.offer.shifts)
    placeView.populate(location: viewModel.offer.location)
    descriptionView.populate(offer: viewModel.offer)
    applyView.populate()
  }

  /// Dismiss view on button action
  @objc func dimissView() {
    self.dismiss(animated: true, completion: nil)
  }

  func setupButtons() {
    dismissButton.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
    shiftsView.calendarButton.addTarget(self, action: #selector(addToCalendar), for: .touchUpInside)
    placeView.mapButton.addTarget(self, action: #selector(showMap), for: .touchUpInside)
  }

  // Set up the views' appearance
  func setupView() {
    self.view.backgroundColor = .almostWhite
    self.view.addSubview(scrollView)

    scrollView.delegate = self
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.distribution = .equalSpacing
    stackView.axis = .vertical
    scrollView.addSubview(stackView)
    stackView.addArrangedSubview(generalView)
    generalView.addSubview(dismissButton)
    stackView.addArrangedSubview(priceView)
    stackView.addArrangedSubview(shiftsView)
    stackView.addArrangedSubview(placeView)
    stackView.addArrangedSubview(descriptionView)
    stackView.addArrangedSubview(applyView)

    let constraints: [NSLayoutConstraint] = [
      scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
      scrollView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),

      dismissButton.rightAnchor.constraint(equalTo: generalView.rightAnchor, constant: -30),
      dismissButton.topAnchor.constraint(equalTo: generalView.layoutMarginsGuide.topAnchor),
      dismissButton.heightAnchor.constraint(equalToConstant: 30),
      dismissButton.widthAnchor.constraint(equalToConstant: 30),

      stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

      generalView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      generalView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1 / 3),
      priceView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      shiftsView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      shiftsView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 1 / 3),
      placeView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      descriptionView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      applyView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ]

    NSLayoutConstraint.activate(constraints)
  }

}
