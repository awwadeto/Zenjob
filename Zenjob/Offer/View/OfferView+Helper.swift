//
//  OfferView+Helper.swift
//  Zenjob
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import UIKit
import EventKit

extension OfferViewController {

  /// Adds Offer's shifts to the user's calendar
  @objc func addToCalendar() {
    let eventStore = EKEventStore()
    eventStore.requestAccess(to: .event) { (granted, error) in
      if granted {
        let event = EKEvent(eventStore: eventStore)
        event.title = self.viewModel.offer.title
        event.startDate = self.viewModel.offer.shifts.first?.beginDate
        event.endDate = self.viewModel.offer.shifts.last?.endDate
        event.notes = self.viewModel.offer.instructions
        event.calendar = eventStore.defaultCalendarForNewEvents
        do {
          try eventStore.save(event, span: .thisEvent)
        } catch let error as NSError {
          print("failed to save event with error: \(error)")
        }
        DispatchQueue.main.async {
          self.shiftsView.calendarButton.isEnabled = false
        }
      } else {
        DispatchQueue.main.async {
          if let error = error {
            self.showAlert(error: error)
          }
        }
      }
    }
  }

  /// Opens MapViewController with the current offer's location
  @objc func showMap() {
    let controller = MapViewController(location: viewModel.offer.location)
    self.present(controller, animated: true, completion: nil)
  }

}
