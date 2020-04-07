//
//  ResultRowView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 09/03/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct ResultRowView: View {
  
  @State var bird: String
  @State var prob: Int
  @State var image: String
  
  
  var body: some View {
    
    
    NavigationLink(destination: InfoView(bird: self.bird, image: self.image, trivia:  trivia[self.image] ?? "N/A", audioURL: Bundle.main.url(forResource: self.image, withExtension: "mp3"))) {
      
      HStack {
        Image(self.image)
          .resizable()
          .imageScale(.small)
          .frame(width: UIScreen.main.bounds.size.width/6, height: UIScreen.main.bounds.size.width/6, alignment: .leading)
          .clipShape(Circle())
          .overlay(Circle().stroke(Color(.black).getTextColor(), lineWidth: 2))
          .padding([.top, .bottom, .leading], 10)
        
        Text(bird)
          .font(.system(.body, design: .rounded)).bold()
          .frame(alignment: .leading)
          .padding([.leading, .trailing], 10)
          .foregroundColor(.white)
        Spacer()
        Text("\(prob)%")
          .font(.system(.body, design: .rounded)).bold()
          .foregroundColor(Color(.black).getTextColor())
          .frame(alignment: .trailing)
          .padding([.trailing], 20)
      }
      .frame(maxWidth: UIScreen.main.bounds.size.width, minHeight: 50, alignment: .leading)
      .background(Color(.black).getCellColour())
      .cornerRadius(20)
      
    }
    .frame(maxWidth: UIScreen.main.bounds.size.width, minHeight: 50)
    .listRowBackground(Color(.black).getBackgroundColor())
  }
}
