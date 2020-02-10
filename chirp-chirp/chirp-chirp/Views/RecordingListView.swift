//
//  RecordingList.swift
//  chirp-chirp
//
//  Created by Suvineet Singh on 31/01/2020.
//  Copyright © 2020 Suvineet Singh. All rights reserved.
//

import SwiftUI

struct RecordingListView: View {
  
  @ObservedObject var audioRecorder: AudioRecorder
  
  var body: some View {
    List {
      ForEach(audioRecorder.recordings, id: \.createdAt) { recording in
        RecordingRow(audioURL: recording.fileURL, audioLength: recording.duration)
      }
    .onDelete(perform: delete)
    .buttonStyle(PlainButtonStyle())
    }
  }
  
  func delete(at offsets: IndexSet) {
    var urlsToDelete = [URL]()
    for i in offsets {
      urlsToDelete.append(audioRecorder.recordings[i].fileURL)
    }
    audioRecorder.deleteRecording(urls: urlsToDelete)
  }
}

struct RecordingListView_Previews: PreviewProvider {
  static var previews: some View {
    RecordingListView(audioRecorder: AudioRecorder())
  }
}

struct RecordingRow: View {
  
  var audioURL: URL
  var audioLength: Float64
  
  @ObservedObject var audioPlayer = AudioPlayer()
  
  var body: some View {
    HStack {
      Text("\(audioURL.lastPathComponent)")
      Spacer()
      Text("\(audioLength)")
      Spacer()
      if audioPlayer.isPlaying {
        Button(action: {
          self.audioPlayer.stopPlayback()
        }) {
          Image(systemName: "stop.fill")
            .imageScale(.large)
        }
      } else {
        Button(action: {
          self.audioPlayer.startPlayback(audio: self.audioURL)
        }) {
          Image(systemName: "play.circle")
            .imageScale(.large)
        }
      }
      Spacer()
      Button(action: {
        print("classify")}) {
          Image(systemName: "magnifyingglass.circle.fill")
            .imageScale(.large)
      }
    }
  }
}
