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
        Text("Predicting...")
      }
    }
    .navigationBarTitle("Predictions")
    .onAppear(perform: classify)
  }
  
  func classify() {
    self.apiService.predict(fileURL: self.fileURL) { result in
      if result != nil {
        self.result = result?.classes ?? []
        self.isLoaded = true
      }
    }
  }
}
