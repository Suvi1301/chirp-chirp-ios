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
      Spacer()
      Text("\(audioLength)")
      Spacer()
      if audioPlayer.isPlaying {
        Button(action: {
          self.audioPlayer.stopPlayback()
        }) {
          Image(systemName: "stop")
            .imageScale(.large)
        }
      } else {
        Button(action: {
          self.audioPlayer.startPlayback(audio: self.audioURL)
        }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
        }
      }
      Spacer()
      NavigationLink(destination: ClassificationResultView(fileURL: self.audioURL)) {
        Image(systemName: "magnifyingglass.circle.fill")
          .resizable()
          .frame(width: 50, height: 50, alignment: .trailing)
      }
    }
  }
}

