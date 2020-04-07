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
      Text("\(String(audioURL.lastPathComponent).dropLast(4).description)")
        .font(.system(.body, design: .rounded)).bold()
        .frame(width: UIScreen.main.bounds.size.width/2)
        .foregroundColor(Color(.black).getTextColor())
      Spacer()
      Text(String(format: "%.1fs", audioLength))
        .font(.system(.body, design: .rounded)).bold()
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.size.width/8)
      Spacer()
      if audioPlayer.isPlaying {
        Button(action: {
          self.audioPlayer.stopPlayback()
        }) {
          Image(systemName: "stop")
            .imageScale(.large)
            .foregroundColor(Color.red)
        }.frame(width: UIScreen.main.bounds.size.width/8)
      } else {
        Button(action: {
          self.audioPlayer.startPlayback(audio: self.audioURL)
        }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
            .foregroundColor(Color.green)
        }.frame(width: UIScreen.main.bounds.size.width/8)
      }
      Spacer()
      NavigationLink(destination: ClassificationResultView(fileURL: self.audioURL)) {
        Image(systemName: "magnifyingglass.circle")
          .resizable()
          .frame(width: 25, height: 25, alignment: .trailing)
          .foregroundColor(Color(.black).getTextColor())
      }
      .buttonStyle(PlainButtonStyle())
      .frame(width: UIScreen.main.bounds.size.width/8)
    }
    .frame(height: 75)
    .background(Color(.black).getCellColour())
    .cornerRadius(20)
    .listRowBackground(Color(.black).getBackgroundColor())
  }
}
