//
//  Extensions.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 31/01/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import Foundation

extension Date {
  
  func toString(dateFormat format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.string(from: self)
  }
}
