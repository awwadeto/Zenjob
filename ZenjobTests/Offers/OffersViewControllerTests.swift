//
//  OffersViewControllerTests.swift
//  ZenjobTests
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import XCTest
@testable import Zenjob

class OffersViewControllerTests: XCTestCase {

  var dispatcher: NetworkDispatcher!
  var sut: OffersViewController!

  override func setUp() {
    super.setUp()
    prepareDispatcher()
    let mockUser = User(username: "mobile@zenjob.com", accessToken: "accessToken", refreshToken: "refreshToken", expiry: 598)
    sut = OffersViewController(dispatcher: dispatcher, user: mockUser)
    _ = sut.view
  }

  override func tearDown() {
    sut = nil
    super.tearDown()
  }

  func testShowEmptyState() {
    XCTAssertEqual(sut.collectionView.backgroundView, nil)
    sut.showEmptyState()
    XCTAssertEqual(sut.collectionView.backgroundView, sut.emptyStateMessage)
  }

  func testHideEmptyState() {
    sut.hideEmptyState()
    XCTAssertEqual(sut.collectionView.backgroundView, nil)
  }

  func testCollectionViewNumberOfItemsInSection() {
    let expectation = self.expectation(description: "fetchOffer")
    sut.viewModel.fetchOffers {
      expectation.fulfill()
    }

    waitForExpectations(timeout: 2, handler: nil)

    XCTAssertEqual(sut.collectionView.numberOfItems(inSection: 0), 10)
  }

  func prepareDispatcher() {
    let mockEnvironment = Environment("mock", host: "https://mock-main.zenjob.org/api/employee/v1")
    URLProtocolMock.add(mock: self.httpMessage(from: "Offers.json"), for: URL(string: "\(mockEnvironment.host)/offers?offset=0")!.absoluteString)

    // now set up a configuration to use our mock
    let config = URLSessionConfiguration.ephemeral
    config.protocolClasses = [URLProtocolMock.self]

    // and create the URLSession from that
    let session = URLSession(configuration: config)

    dispatcher = NetworkDispatcher(environment: mockEnvironment)
    dispatcher.setSession(session: session)
  }

}
