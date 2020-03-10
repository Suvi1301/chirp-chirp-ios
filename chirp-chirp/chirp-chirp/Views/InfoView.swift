//
//  InfoView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 08/03/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct InfoView: View {
  
  @State var bird: String
  @State var image: String
  @State var trivia: String
//  @State var audioURL: URL
  
  var body: some View {
    VStack {
      Image(self.image)
        .resizable()
        .frame(width: UIScreen.main.bounds.size.width - 50, height: UIScreen.main.bounds.size.width - 50, alignment: .top)
        .padding(.all)
      Text(self.trivia)
    }.navigationBarTitle(self.bird)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(bird: "Common Blackbird", image: "common_blackbird", trivia: trivia["common_blackbird"] ?? "N/A")
  }
}
