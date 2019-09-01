//
//  Helper.swift
//  ZenjobTests
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import XCTest

func getData(name: String, withExtension: String = "json", forTest: XCTestCase) -> Data {
  let bundle = Bundle(for: type(of: forTest))
  let fileUrl = bundle.url(forResource: name, withExtension: withExtension)
  let data = try! Data(contentsOf: fileUrl!)
  return data
}
