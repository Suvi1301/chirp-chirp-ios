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
    
    ZStack {
      Color(.black).getBackgroundColor()
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        Color(.black).getCellColour()
          .frame(width: UIScreen.main.bounds.size.width - 50, height: UIScreen.main.bounds.size.width - 50, alignment: .topLeading)
          .overlay(
        
            Image(self.image)
              .resizable()
              .overlay(
                Rectangle()
                  .stroke(Color(.black).getTextColor(), lineWidth: 6)
              )
              .padding(.all, 25)
          )
          .cornerRadius(20)
          .padding(.top, 25)
        
        Color(.black).getCellColour()
          .frame(maxWidth: UIScreen.main.bounds.size.width - 50, maxHeight: .infinity, alignment: .topLeading)
          .overlay(
            Text(self.trivia)
            .foregroundColor(.white)
            .font(.system(.body, design: .rounded)).bold()
          )
          .cornerRadius(20)
      
        
        HStack {
          if audioPlayer.isPlaying {
            Button(action: {
              self.audioPlayer.stopPlayback()
            }) {
              
              Rectangle()
                .frame(width: 50, height: 50)
                .opacity(0)
                .overlay(
                  Image(systemName: "stop")
                    .resizable()
                    .foregroundColor(.red)
                )
                .padding(.leading, 20)
            }
          } else {
            Button(action: {
              guard let x = self.audioURL else {
                print("Audio url not found!")
                return
              }
              self.audioPlayer.startPlayback(audio: x)
            }) {
              Circle()
                .frame(width: 50, height: 50)
                .opacity(0)
                .overlay(
                  Image(systemName: "play.circle")
                    .resizable()
                    .foregroundColor(.green)
                )
                .padding(.leading, 20)
            }
          }
          Text("Hear me sing!")
            .foregroundColor(.white)
            .font(.system(.body, design: .rounded)).bold()
            .padding(.leading, 50)
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width - 50, maxHeight: 100, alignment: .leading)
        .background(Color(.black).getCellColour())
        .cornerRadius(20)
      }
    }
    .navigationBarTitle(self.bird)
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView(bird: "Common Blackbird", image: "common_blackbird", trivia: trivia["common_blackbird"] ?? "N/A", audioURL: Bundle.main.url(forResource: "common_blackbird", withExtension: "mp3"))
  }
}
