//
//  Dispatcher.swift
//  Zenjob
//
//  Created by Awwad on 8/31/19.
//  Copyright © 2019 Awwad. All rights reserved.
//

import Foundation

public protocol Dispatcher {

  init(environment: Environment)

  func execute(request: Request, completion: @escaping (_ response: Response) -> Void) throws

}
