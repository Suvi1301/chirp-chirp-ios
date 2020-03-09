//
//  ClassifcationResultView.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 08/03/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct ClassificationResultView: View {
  
  @ObservedObject var apiService = APIService()
  @State var fileURL: URL
  
  var body: some View {
      List {
        ForEach([Classification(bird: "test1", prob: 10, image: "great_tit"), Classification(bird: "test2", prob: 25, image: "common_blackbird")], id: \.prob) { prediction in
          ResultRowView(bird: prediction.bird, prob: prediction.prob, image: prediction.image)
        }
        .buttonStyle(PlainButtonStyle())
    }.navigationBarTitle("Predictions")
  }
  
  func classify(fileURL: URL) {
    let group = DispatchGroup()
    group.enter()
    DispatchQueue.main.asyncAfter(deadline: .now()) {
      self.apiService.predict(fileURL: fileURL)
      group.leave()
    }
    group.notify(queue: .main) {
      print(self.apiService.result)
    }
  }
}


struct ResultRowView: View {
  
  @State var bird: String
  @State var prob: Int
  @State var image: String
  
  
  var body: some View {
    HStack {
      Text(bird)
      Spacer()
      Text("\(prob)%")
      Spacer()
      NavigationLink(destination: InfoView(bird: self.bird, image: self.image, trivia:  trivia[self.image] ?? "N/A")) {
        Image(self.image)
          .resizable()
          .imageScale(.small)
          .frame(width: 50, height: 50, alignment: .trailing)
          .padding(.trailing, 0)
      }.padding(.trailing, 0)
    }
  }
}
