//
//  ContentView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 07/12/2019.
//  Copyright © 2019 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var showSplash = true
  
  var body: some View {
    
    ZStack {
      if !showSplash {
        MainScreenView(audioRecorder: AudioRecorder())
      }
      
      SplashScreen()
        .opacity(showSplash ? 1 : 0)
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            SplashScreen.shouldAnimate = false
            withAnimation() {
              self.showSplash = false
            }
          }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

