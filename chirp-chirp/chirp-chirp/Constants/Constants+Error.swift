//
//  Constants+Error.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 19/02/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import Foundation
import SwiftyJSON

internal enum ApplicationError: Error {
  case technicalError
}

internal enum APIError: Error {
  case serverError
  case clientError
  case failureWithData(statusCode: Int, json: JSON)
}
