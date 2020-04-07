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
    
    let navBarAppearance = UINavigationBarAppearance()
    navBarAppearance.configureWithOpaqueBackground()
    navBarAppearance.backgroundColor = UIColor().getBackgroundColor()
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    
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
                .frame(width: 75, height: 75)
                .clipped()
                .foregroundColor(.red)
                .padding(.top, 10)
            }
            Text("Stop Recording")
              .padding(.bottom, 20)
          } else {
            Button(action: {self.audioRecorder.startRecording()}) {
              Circle()
                .overlay(
                  Circle()
                    .stroke(Color.white,lineWidth: 2)
                )
                .frame(width: 75, height: 75)
                .foregroundColor(.red)
                .padding(.top, 10)
            }
            Text("Record")
              .padding(.bottom, 20)
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
            .foregroundColor(.white)
            .padding([.top, .bottom], 5)
            .padding([.leading, .trailing], 10)
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.black).getTextColor(), lineWidth: 2)
            )
        },
        trailing:
          EditButton()
            .foregroundColor(.white)
            .padding([.top, .bottom], 5)
            .padding([.leading, .trailing], 10)
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(Color(.black).getTextColor(), lineWidth: 2)
            )
            )
    }
      .accentColor( .black)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(audioRecorder: AudioRecorder())
  }
}

