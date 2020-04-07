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
  @State var result = [Classification]()
  @State var isLoaded: Bool = false
  
  var body: some View {
    ZStack {
      List {
        ForEach(result, id: \.image) { prediction in
          ResultRowView(bird: prediction.bird, prob: prediction.prob, image: prediction.image)
        }
        .buttonStyle(PlainButtonStyle())
      }
      if !isLoaded {
        VStack {
          ActivityIndicator()
            .frame(width: 50, height: 50)
          Text("Predicting")
            .font(.system(.body, design: .rounded)).bold()
            .foregroundColor(.white)
        }.foregroundColor(Color(.black).getTextColor())
      }
    }
    .navigationBarTitle("Predictions")
    .onAppear(perform: classify)
  }
  
  func classify() {
    if !isLoaded {
      self.apiService.predict(fileURL: self.fileURL) { result in
        if result != nil {
          self.result = result?.classes ?? []
          self.result = self.result.sorted(by: { (cls1: Classification, cls2: Classification) -> Bool in
            return cls1.prob > cls2.prob
          })
          self.isLoaded = true
        }
      }
    }
  }
}
