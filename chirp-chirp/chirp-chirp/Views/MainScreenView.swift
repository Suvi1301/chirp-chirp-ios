//
//  MainScreenView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 07/04/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct MainScreenView: View {
  
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
              .font(.system(.body, design: .rounded)).bold()
              .foregroundColor(.white)
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
              .font(.system(.body, design: .rounded)).bold()
              .foregroundColor(.white)
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
            .font(.system(.body, design: .rounded)).bold()
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

