//
//  BirdsListView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 24/03/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct BirdListView: View {

  var birds = [
    "coal_tit",
    "common_blackbird",
    "common_chaffinch",
    "common_chiffchaff",
    "common_nightingale",
    "common_whitethroat",
    "corn_bunting",
    "eurasian_blackcap",
    "eurasian_blue_tit",
    "eurasian_skylark",
    "eurasian_tree_sparrow",
    "eurasian_wren",
    "european_robin",
    "great_spotted_woodpecker",
    "great_tit",
    "red_crossbill",
    "song_thrush",
    "tawny_owl",
    "yellowhammer",
  ]
  
  var body: some View {
    List {
      ForEach(self.birds, id: \.self) { bird in
        BirdListRowView(bird: species[bird] ?? "coal_tit", image: bird)
      }
      .buttonStyle(PlainButtonStyle())
    }
  }
}
