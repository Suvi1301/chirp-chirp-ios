//
//  RecordingRowView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 08/03/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI
struct RecordingRowView: View {
  
  var audioURL: URL
  var audioLength: Float64
  
  @ObservedObject var audioPlayer = AudioPlayer()
  @State private var showModal = false
  
  var body: some View {
    HStack {
      Text("\(audioURL.lastPathComponent)")
        .frame(width: UIScreen.main.bounds.size.width/2)
      Spacer()
      Text(String(format: "%.2fs", audioLength))
        .frame(width: UIScreen.main.bounds.size.width/8)
      Spacer()
      if audioPlayer.isPlaying {
        Button(action: {
          self.audioPlayer.stopPlayback()
        }) {
          Image(systemName: "stop")
            .imageScale(.large)
        }.frame(width: UIScreen.main.bounds.size.width/8)
      } else {
        Button(action: {
          self.audioPlayer.startPlayback(audio: self.audioURL)
        }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
        }.frame(width: UIScreen.main.bounds.size.width/8)
      }
      Spacer()
      NavigationLink(destination: ClassificationResultView(fileURL: self.audioURL)) {
        Image(systemName: "magnifyingglass.circle")
          .resizable()
          .frame(width: 25, height: 25, alignment: .trailing)
      }.frame(width: UIScreen.main.bounds.size.width/8)
    }
    .frame(height: 75)
    .background(Color(.black).getCellColour())
    .cornerRadius(20)
    .listRowBackground(Color(.black).getBackgroundColor())
  }
}
