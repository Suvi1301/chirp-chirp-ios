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
  
  func predict(fileURL: URL, completion: @escaping (Result?) -> ()) {
    let fileName = fileURL.lastPathComponent
    guard let audioFile: Data = try? Data (contentsOf: fileURL) else { return }
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(audioFile, withName: "audio-sample", fileName: fileName, mimeType: "audio/m4a")
    }, to: "http://90.221.3.135:5000/predict", encodingCompletion: { encodingResult in
      switch encodingResult {
      case .success(let upload, _, _):
        upload.responseJSON { response in
          if let jsonResponse = response.result.value as? [String: Any] {
            self.handleSuccess(jsonResponse) {
              (status) in
              if status != nil {
                completion(self.result)
              }
            }
          }
        }
      case .failure(let encodingError):
        print(encodingError)
      }
    })
  }
  
  func handleSuccess(_ response: [String: Any], completion: @escaping (Result?) -> ()) {
    
    guard let result = Result.init(response) else {
      return
    }
    self.result = result
    completion(self.result)
  }
  
  func handleError(_ error: Error) {
    
  }
  
}





