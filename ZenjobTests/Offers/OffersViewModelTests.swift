//
//  OffersViewModelTests.swift
//  ZenjobTests
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import XCTest
@testable import Zenjob

class OffersViewModelTests: XCTestCase {

  var dispatcher: NetworkDispatcher!
  var sut: OffersViewModel!

  override func setUp() {
    super.setUp()
    prepareDispatcher()
    let mockUser = User(username: "mobile@zenjob.com", accessToken: "accessToken", refreshToken: "refreshToken", expiry: 598)
    sut = OffersViewModel(dispatcher: dispatcher, user: mockUser)
  }

  override func tearDown() {
    sut = nil
    super.tearDown()
  }

  func testNumberOfCells() {
    XCTAssertEqual(sut.numberOfCells, 0)

    let expectation = self.expectation(description: "fetchOffers")
    sut.fetchOffers {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)
    XCTAssertEqual(sut.numberOfCells, 10)
  }

  func testFetchOffersOnSuccess() {
    let expectation = self.expectation(description: "fetchOffers")
    sut.fetchOffers {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)
    XCTAssertEqual(sut.offers.count, 10)
  }

  func testFetchOffersOnError() {
    let expectation = self.expectation(description: "fetchOffers")
    sut.fetchOffers(offset: "2") {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)
    XCTAssertEqual(sut.offers.count, 0)
    XCTAssertEqual(sut.error?.localizedDescription, "The data couldn’t be read because it is missing.".localized)
  }

  func testIsMultipleShifts() {
    let expectation = self.expectation(description: "fetchOffers")
    sut.fetchOffers {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)

    XCTAssertEqual(sut.isMultipleShifts(row: 0), false)
    XCTAssertEqual(sut.isMultipleShifts(row: 1), true)
  }

  func prepareDispatcher() {
    let mockEnvironment = Environment("mock", host: "https://mock-main.zenjob.org/api/employee/v1")
    URLProtocolMock.add(mock: self.httpMessage(from: "Offers.json"), for: URL(string: "\(mockEnvironment.host)/offers?offset=0")!.absoluteString)
    URLProtocolMock.add(mock: self.httpMessage(from: "OffersError.json"), for: URL(string: "\(mockEnvironment.host)/offers?offset=2")!.absoluteString)

    // now set up a configuration to use our mock
    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolMock.self]

    // and create the URLSession from that
    let session = URLSession(configuration: config)

    dispatcher = NetworkDispatcher(environment: mockEnvironment)
    dispatcher.setSession(session: session)
  }

}
