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
  @State var audioURL: URL?
  
  @ObservedObject var audioPlayer = AudioPlayer()
  
  var body: some View {
    VStack {
      Image(self.image)
        .resizable()
        .frame(width: UIScreen.main.bounds.size.width - 50, height: UIScreen.main.bounds.size.width - 50, alignment: .topLeading)
        .padding(.all)
      Spacer()
      Text(self.trivia)
      Spacer()
      Text("Sample audio for \(self.bird)")
      if audioPlayer.isPlaying {
        Button(action: {
          self.audioPlayer.stopPlayback()
        }) {
          Image(systemName: "stop")
            .imageScale(.large)
        }.frame(width: UIScreen.main.bounds.size.width/8)
      } else {
        Button(action: {
          guard let x = self.audioURL else {
            print("Audio url not found!")
            return
          }
          self.audioPlayer.startPlayback(audio: x)
        }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
        }.frame(width: UIScreen.main.bounds.size.width/8)
      }
      Spacer()
    }.navigationBarTitle(self.bird)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(bird: "Common Blackbird", image: "common_blackbird", trivia: trivia["common_blackbird"] ?? "N/A", audioURL: Bundle.main.url(forResource: "common_blackbird", withExtension: "mp3"))
  }
}
