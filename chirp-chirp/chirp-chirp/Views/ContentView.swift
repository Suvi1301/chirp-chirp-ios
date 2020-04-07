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
  
  init(audioRecorder: AudioRecorder) {
    UITableView.appearance().backgroundColor = UIColor().getBackgroundColor()
    UINavigationBar.appearance().tintColor = UIColor().getBackgroundColor()
    UINavigationBar.appearance().backgroundColor = UIColor().getBackgroundColor()

    self.audioRecorder = audioRecorder
  }
  
  var body: some View {
    
    NavigationView {
      VStack {
        RecordingListView(audioRecorder: audioRecorder)
        
        Group {
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
              Circle()
                .overlay(
                  Circle()
                    .stroke(Color.white,lineWidth: 2)
                )
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .padding(.bottom, 40)
            }
          }
        }
        .frame(width: UIScreen.main.bounds.size.width, alignment: .center)
        
      }
      .background(Color(.black).getBackgroundColor())
      .edgesIgnoringSafeArea([.bottom, .leading, .trailing])
      .navigationBarTitle("Chirp Chirp", displayMode: .inline)
      .navigationBarItems(leading:
        NavigationLink(destination: BirdListView()) {
          Text("Birds")
            .foregroundColor(Color.white)
            .padding([.top, .bottom], 5)
            .padding([.leading, .trailing], 10)
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2)
            )
        },
        trailing:
          EditButton()
            .foregroundColor(Color.white)
            .padding([.top, .bottom], 5)
            .padding([.leading, .trailing], 10)
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 2)
            )
            )
    }
  .statusBar(hidden: true)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(audioRecorder: AudioRecorder())
  }
}

