//
//  MapViewController.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

  var mapView: MKMapView = {
    let mapView = MKMapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    return mapView
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

  var viewModel: MapViewModel

  init(location: Location) {
    self.viewModel = MapViewModel(location: location)
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupAnnotation()
  }

  @objc func dimissView() {
    self.dismiss(animated: true, completion: nil)
  }

  func setupAnnotation() {
    if let latitude = viewModel.location.locationLatitude, let longitude = viewModel.location.locationLongitude {
      let annotation = MKPointAnnotation()
      annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      self.mapView.addAnnotation(annotation)
      let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
      self.mapView.setRegion(region, animated: true)
    }
  }

  func setupView() {
    dismissButton.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
    self.view.addSubview(mapView)
    self.view.addSubview(dismissButton)

    NSLayoutConstraint.activate([
      mapView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
      mapView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
      mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
      mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

      dismissButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
      dismissButton.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
      dismissButton.heightAnchor.constraint(equalToConstant: 30),
      dismissButton.widthAnchor.constraint(equalToConstant: 30),

      ])
  }

  func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "pin"
    var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
    if let pinView = pinView {
      pinView.annotation = annotation
    } else {
      pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      pinView!.pinTintColor = .red
    }
    return pinView
  }

}