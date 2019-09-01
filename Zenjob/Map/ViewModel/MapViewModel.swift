//
//  MapViewModel.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

class MapViewModel {

  // MARK: - Properites

  var location: Location

  // MARK: - Initialization

  
  /**
   Initialize a new MapViewModel.
   - Parameter location: Location object from an offer
   */
  init(location: Location) {
    self.location = location
  }

}
