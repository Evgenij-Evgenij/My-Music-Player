//
//  TrackListView.swift
//  FullMusicPlayerApp
//
//  Created by Евгений Воронов on 30.06.2022.
//

import SwiftUI
import AVFoundation

struct TrackListView: View {
    var album: Album
    @State private var playPausButton = false
    @StateObject private var viewModel = TrackListViewModel()
    var imagePlay =  "play.circle"
    var imagePause = "pause.circle"

    var body: some View {
        VStack {
            List(album.songs,
                 id: \.name) { song in
                HStack{
                    Button {
                        playPausButton.toggle()
                        
                        if playPausButton == true {
                            viewModel.play(song: song)
                        } else {
                            viewModel.pause(song: song)
                        }
                        
//                        if viewModel == nil {
//                            viewModel.play(song: song)
//                        } else {
//                            viewModel.player?.play()
//                        }
//                        playPausButton.toggle()
//                        if playPausButton == true {
//                            viewModel.play(song: song)
//                        } else {
//                            viewModel.pause(song: song)
//                        }

                        
            
                    } label: {
                       Image(systemName:
                                playPausButton ? "play.circle" : "pause.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05)
                            
                    }

                    
                    Image(song.image)
                        .resizable()
                        //.aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width * 0.15, height: UIScreen.main.bounds.height * 0.07)
                    Text(song.name)
                }
            }
        }
    }
    private func playPauseBut() -> some View {
        
        Button {
            playPausButton.toggle()
        } label: {
            Image(systemName: playPausButton ? imagePlay : imagePause)
        }

    }
}

struct TrackListView_Previews: PreviewProvider {
    static var previews: some View {
        TrackListView(album: Album(name: "Album name", image: "image", songs: [Album.Song(name: "Song", image: "image", artist: "Artist", fileName: "Example")]))
    }
}

final class TrackListViewModel: ObservableObject {
    
    private let playerManager = PlayerManager.shared
    
//    var player: AVPlayer?
    
    func playPaus( song: Album.Song) {
        if playerManager.isPlayingNow == true {
            playerManager.play(song: song)
        } else {
            playerManager.pause()
        }
    }
    
    func play(song: Album.Song) {
            playerManager.play(song: song)
     }
    
    func pause(song: Album.Song) {
        playerManager.pause()
    }
}


//struct ButtunPlay {
//    var play = Image(systemName: "play.circle")
//}
//extension Image {
//    func settingsImage(){
//       self
//    .resizable()
//    .scaledToFit()
//    .frame(width: UIScreen.main.bounds.height * 0.05, height: UIScreen.main.bounds.height * 0.05)
//    }
//}
