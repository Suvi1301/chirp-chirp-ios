//
//  Extensions+Color.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 07/04/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

extension UIColor {
  func getBackgroundColor() -> UIColor {
    return UIColor.init(red: 0.120, green: 0.147, blue: 0.238, alpha: 1)
  }
}

extension Color {
  func getBackgroundColor() -> Color {
    return Color.init(red: 0.120, green: 0.147, blue: 0.238, opacity: 1)
    
//    return Color.init(red: 0.137, green: 0.310, blue: 0.498, opacity: 1)
  }
  
  func getCellColour() -> Color {
    
    return Color.init(.sRGB, red: 0.222, green: 0.256, blue: 0.397, opacity: 1)
//    return Color.init(.sRGB, red: 0, green: 0.586, blue: 0.534, opacity: 1)
  }
}
