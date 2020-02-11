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


class APIService: ObservableObject {
  
  let objectWillChange = PassthroughSubject<AudioPlayer, Never>()
  
  func predict(fileURL: URL) {
    let fileName = fileURL.lastPathComponent
    guard let audioFile: Data = try? Data (contentsOf: fileURL) else {return}
    Alamofire.upload(multipartFormData: { (multipartFormData) in
      multipartFormData.append(audioFile, withName: "audio-sample", fileName: fileName, mimeType: "audio/m4a")
    }, to: "http://94.2.214.213:5000/predict", encodingCompletion: { encodingResult in
      switch encodingResult {
      case .success(let upload, _, _):
        upload.responseJSON { response in
          if let jsonResponse = response.result.value as? [String: Any] {
            print(jsonResponse)
          }
        }
      case .failure(let encodingError):
        print(encodingError)
      }
    })
  }
}





