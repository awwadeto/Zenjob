//
//  HTTPMessage.swift
//  ZenjobTests
//
//  Created by Awwad on 9/1/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import XCTest

struct HTTPMessage {

  private let message: CFHTTPMessage

  init(data: Data) {

    message = CFHTTPMessageCreateEmpty(kCFAllocatorDefault, false).takeRetainedValue()
    let didAppend = data.withUnsafeBytes { bytes in
      return CFHTTPMessageAppendBytes(message, bytes, data.count)
    }

    //CFHTTPMessageCreateResponse(kCFAllocatorDefault, statusCode, nil, kCFHTTPVersion1_0).takeRetainedValue()
    guard didAppend else {
      preconditionFailure("Couldn't create a HTTPMessage from data. Check if your httpResponse file has proper content!")
    }
  }

  var body: Data? {
    return CFHTTPMessageCopyBody(message)?.takeRetainedValue() as Data?
  }

  func value(forHeaderField headerField: String) -> String? {
    return CFHTTPMessageCopyHeaderFieldValue(message, headerField as CFString)?.takeRetainedValue() as String?
  }

  var allHeaderFields: [String: String] {
    return CFHTTPMessageCopyAllHeaderFields(message)?.takeRetainedValue() as? [String: String] ?? [:]
  }

  var httpVersion: String {
    return CFHTTPMessageCopyVersion(message).takeRetainedValue() as String
  }

  var statusCode: Int? {
    return Int(CFHTTPMessageGetResponseStatusCode(message))
  }
}

extension XCTestCase {

  func httpMessage(from filename: String) -> HTTPMessage {

    guard let file = Bundle(for: type(of: self)).url(forResource: filename, withExtension: nil), let data = try? Data(contentsOf: file) else {
      preconditionFailure("Couldn't find file with name: \(filename) in bundle or load its content")
    }

    return HTTPMessage(data: data)
  }
}
