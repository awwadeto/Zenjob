//
//  MapView+MapDelegate.swift
//  Zenjob
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit
import MapKit

extension MapViewController: MKMapViewDelegate {

  /// Returns the view associated with the specified annotation object.
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
