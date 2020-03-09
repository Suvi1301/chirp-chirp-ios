//
//  APIService.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 11/02/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import SwiftyJSON


class APIService: ObservableObject {
  
  @Published var result: Result?
  
  let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
  let objectWillChng = PassthroughSubject<Result, Never>()
  
  func predict(fileURL: URL) {
    let fileName = fileURL.lastPathComponent
    guard let audioFile: Data = try? Data (contentsOf: fileURL) else { return }
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(audioFile, withName: "audio-sample", fileName: fileName, mimeType: "audio/m4a")
    }, to: "http://90.221.3.135:5000/predict", encodingCompletion: { encodingResult in
      switch encodingResult {
      case .success(let upload, _, _):
        upload.responseJSON { response in
          if let jsonResponse = response.result.value as? [String: Any] {
            return self.handleSuccess(jsonResponse)
          }
        }
      case .failure(let encodingError):
        print(encodingError)
      }
    })
  }
  
  func handleSuccess(_ response: [String: Any]) {
    
    guard let result = Result.init(response) else {
      return
    }
    return self.result = result
  }
  
  func handleError(_ error: Error) {
    
  }
  
}





