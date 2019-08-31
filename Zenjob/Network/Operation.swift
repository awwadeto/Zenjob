//
//  Operation.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

protocol Operation {

  associatedtype Output

  var request: Request { get }

  func execute(in dispatcher: Dispatcher, completion: @escaping (_ onSuccess: Output?, _ onError: Error?) -> Void)

}
