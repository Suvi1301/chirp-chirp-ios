//
//  SplashScreen.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 07/04/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
  static var shouldAnimate = true
  let fuberBlue = Color("Fuber blue")
  let uLineWidth: CGFloat = 5
  let uZoomFactor: CGFloat = 1.4
  let lineWidth:  CGFloat = 4
  let lineHeight: CGFloat = 28
  let uSquareLength: CGFloat = 12
  
  @State var percent = 0.0
  @State var uScale: CGFloat = 1
  @State var squareColor = Color.white
  @State var squareScale: CGFloat = 1
  @State var lineScale: CGFloat = 1
  @State var textAlpha = 0.0
  @State var textScale: CGFloat = 1
  @State var coverCircleScale: CGFloat = 1
  @State var coverCircleAlpha = 0.0
  
  var body: some View {
    ZStack {
      
      Color(.black).getBackgroundColor()
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        HStack {
          Rectangle()
            .frame(width: UIScreen.main.bounds.size.width/4, height: UIScreen.main.bounds.size.width/4, alignment: .center)
            .opacity(0)
            .overlay(
              Image("bird_red")
              .resizable()
          )
          Rectangle()
            .frame(width: UIScreen.main.bounds.size.width/4, height: UIScreen.main.bounds.size.width/4, alignment: .center)
            .opacity(0)
            .overlay(
              Image("bird_blue")
              .resizable()
          )
        }
        .frame(alignment: .leading)
        
        HStack {
          Text("CHIRP")
            .font(.system(.largeTitle, design: .rounded)).bold()
            .foregroundColor(Color(.black).getTextColor())
          
          Text("CHIRP")
            .font(.system(.largeTitle, design: .rounded)).bold()
            .foregroundColor(.red)
        }
        ActivityIndicator()
          .frame(width: 50, height: 50)
      }
      .frame(maxWidth: .infinity)
    }
  }
}

