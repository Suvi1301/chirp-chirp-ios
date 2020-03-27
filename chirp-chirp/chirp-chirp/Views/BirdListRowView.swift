//
//  BirdListRowView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 24/03/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct BirdListRowView: View {
  
  @State var bird: String
  @State var image: String
  
  var body: some View {
    HStack {
      Text(bird)
        .frame(width: UIScreen.main.bounds.size.width/4)
      Spacer()
      NavigationLink(destination: InfoView(bird: self.bird, image: self.image, trivia:  trivia[self.image] ?? "N/A", audioURL: Bundle.main.url(forResource: self.image, withExtension: "mp3"))) {
        Image(self.image)
          .resizable()
          .imageScale(.small)
          .frame(width: 100, height: 100, alignment: .trailing)
      }.padding(.trailing, 0)
        .frame(width: UIScreen.main.bounds.size.width/2)
    }
  }
}

