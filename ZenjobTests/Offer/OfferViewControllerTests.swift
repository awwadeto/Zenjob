//
//  OfferViewControllerTests.swift
//  ZenjobTests
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import XCTest
@testable import Zenjob

class OfferViewControllerTests: XCTestCase {

  var dispatcher: NetworkDispatcher!
  var sut: OfferViewController!

  override func setUp() {
    super.setUp()
    prepareDispatcher()
    let mockUser = User(username: "mobile@zenjob.com", accessToken: "accessToken", refreshToken: "refreshToken", expiry: 598)
    let mockOffer = prepareData()
    sut = OfferViewController(dispatcher: dispatcher, user: mockUser, offer: mockOffer)
    _ = sut.view
  }

  override func tearDown() {
    sut = nil
    super.tearDown()
  }

  func testPopulatingGeneralView() {
    let expectation = self.expectation(description: "fetchOffer")
    sut.viewModel.fetchOffer {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)

    sut.populate()

    XCTAssertEqual(sut.generalView.titleLabel.text, sut.viewModel.offer.title)
    XCTAssertEqual(sut.generalView.totalEarnLabel.text, sut.viewModel.offer.earningTotal.toCurrency)
    XCTAssertEqual(sut.generalView.hourlyEarnLabel.text, String(format: NSLocalizedString("hourlyEarn", comment: ""), sut.viewModel.offer.earningHourly.toCurrency))
  }

  func testPopulatingPlaceView() {
    let expectation = self.expectation(description: "fetchOffer")
    sut.viewModel.fetchOffer {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)

    sut.populate()

    XCTAssertEqual(sut.placeView.locationLabel.text, sut.viewModel.offer.location.locationSearchString)
  }

  func prepareDispatcher() {
    let mockEnvironment = Environment("mock", host: "https://mock-main.zenjob.org/api/employee/v1")
    URLProtocolMock.add(mock: self.httpMessage(from: "Offer.json"), for: URL(string: "\(mockEnvironment.host)/offers/g3pfhmFPmimg11")!.absoluteString)
    URLProtocolMock.add(mock: self.httpMessage(from: "OfferError.json"), for: URL(string: "\(mockEnvironment.host)/offers/i_TBkrB9g7uQ")!.absoluteString)

    // now set up a configuration to use our mock
    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolMock.self]

    // and create the URLSession from that
    let session = URLSession(configuration: config)

    dispatcher = NetworkDispatcher(environment: mockEnvironment)
    dispatcher.setSession(session: session)
  }

  func prepareData() -> Offer {
    let data = getData(name: "Offer", forTest: self)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return try! decoder.decode(Offer.self, from: data)
  }
  
}
