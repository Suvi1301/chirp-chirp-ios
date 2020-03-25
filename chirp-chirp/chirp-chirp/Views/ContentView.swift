//
//  ContentView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 07/12/2019.
//  Copyright © 2019 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var audioRecorder: AudioRecorder
  
  var body: some View {
    
    NavigationView {
      VStack {
        RecordingListView(audioRecorder: audioRecorder)
        if audioRecorder.recording {
          Button(action: {self.audioRecorder.stopRecording()}) {
            Image(systemName: "stop")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
              .clipped()
              .foregroundColor(.red)
              .padding(.bottom, 40)
          }
        } else {
          Button(action: {self.audioRecorder.startRecording()}) {
            Image(systemName: "circle.fill")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
              .clipped()
              .foregroundColor(.red)
              .padding(.bottom, 40)
          }
        }
      }
      .navigationBarTitle("Chirp Chirp")
      .navigationBarItems(leading:
        NavigationLink(destination: BirdListView()) {
          Text("Birds")
        },
        trailing: EditButton()
      )
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(audioRecorder: AudioRecorder())
  }
}

