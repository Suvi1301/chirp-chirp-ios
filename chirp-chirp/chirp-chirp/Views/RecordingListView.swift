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
  
  init(audioRecorder: AudioRecorder) {
    UITableView.appearance().tableFooterView = UIView()
    UITableView.appearance().separatorStyle = .none
    self.audioRecorder = audioRecorder
  }
  
  var body: some View {
    List {
      Section(header: Text("My Recordings").frame(maxWidth: .infinity, alignment: .center)) {
        ForEach(audioRecorder.recordings.reversed(), id: \.createdAt) { recording in
          RecordingRowView(audioURL: recording.fileURL, audioLength: recording.duration)
          }
          .onDelete(perform: delete)
          .buttonStyle(PlainButtonStyle())
      }
    }
  }
  
  func delete(at offsets: IndexSet) {
    var urlsToDelete = [URL]()
    for i in offsets {
      urlsToDelete.append(audioRecorder.recordings.reversed()[i].fileURL)
    }
    audioRecorder.deleteRecording(urls: urlsToDelete)
  }
}

struct RecordingListView_Previews: PreviewProvider {
  static var previews: some View {
    RecordingListView(audioRecorder: AudioRecorder())
  }
}
