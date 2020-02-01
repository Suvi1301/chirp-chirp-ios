//
//  AudioRecorder.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 31/01/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import Foundation
import Combine
import AVFoundation

class AudioRecorder: NSObject, ObservableObject {
  
  let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
  var audioRecorder: AVAudioRecorder!
  
  var recordings = [Recording]()
  
  var recording = false {
    didSet {
      objectWillChange.send(self)
    }
  }
  
  override init() {
    super.init()
    fetchRecordings()
  }
  
  func startRecording() {
    
    let recordingSession = AVAudioSession.sharedInstance()
    
    do {
      try recordingSession.setCategory(.playAndRecord, mode: .default)
      try recordingSession.setActive(true)
    } catch {
      print("Failed to set up recording session")
    }
    
    let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    let audioFileName = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_HH:mm:ss")).m4a")
    
    let settings = [
      AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
      AVSampleRateKey: 12000,
      AVNumberOfChannelsKey: 1,
      AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
    ]
    
    do {
      audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
      audioRecorder.record()
      
      recording = true
    } catch {
      print("Could not start recording: \(error)")
    }
  }
  
  func stopRecording() {
    audioRecorder.stop()
    recording = false
    fetchRecordings()
  }
  
  func fetchRecordings() {
    recordings.removeAll()
    
    let fileManager = FileManager.default
    let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
    for audio in directoryContents {
      let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio), duration: getDuration(for: audio))
      recordings.append(recording)
    }
    
    recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
    objectWillChange.send(self)
  }
  
  func getCreationDate(for file: URL) -> Date {
    if let attribtutes = try? FileManager.default.attributesOfItem(atPath: file.path) as [FileAttributeKey: Any],
      let creationDate = attribtutes[FileAttributeKey.creationDate] as? Date {
      return creationDate
    } else {
      return Date()
    }
  }
  
  func getDuration(for file: URL) -> Float64 {
    let audioAsset = AVURLAsset.init(url: file)
    let duration = audioAsset.duration
    return CMTimeGetSeconds(duration)
  }
  
  func deleteRecording(urls: [URL]) {
    
    for url in urls {
      print(url)
      do {
        try FileManager.default.removeItem(at: url)
      } catch {
        print("File could not be deleted")
      }
    }
    
    fetchRecordings()
  }
}
