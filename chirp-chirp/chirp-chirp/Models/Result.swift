//
//  Result.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 15/02/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import Foundation
import SwiftyJSON
import Combine

private let species: [String: String] = [
  "coal_tit": "Coal Tit",
  "common_blackbird": "Common Blackbird",
  "common_chaffinch": "Common Chaffinch",
  "common_chiffchaff": "Common Chiffchaff",
  "common_nightingale":  "Common Nightingale",
  "common_whitethroat": "Common Whitethroat",
  "corn_bunting": "Corn Bunting",
  "eurasian_blackcap": "Eurasian Blackcap",
  "eurasian_blue_tit": "Eurasian Blue Tit",
  "eurasian_skylark": "Eurasian Skylard",
  "eurasian_tree_sparrow": "Eurasian Tree Sparrow",
  "eurasian_wren": "Eurasian Wren",
  "european_robin": "European Robin",
  "great_spotted_woodpecker": "Great Spotted Woodpecker",
  "great_tit": "Great Tit",
  "red_crossbill": "Red Crossbill",
  "song_thrush": "Song Thrush",
  "tawny_owl": "Tawny Owl",
  "yellowhammer": "Yellow Hammer",
]

struct Result {
  
  var classes =  [Classification]()
  var image = ""
  
  init?(_ response: [String: Any]) {
    guard let result = response["result"] as? [String: Int] else {
        return
    }
    print(result)
  }
}
