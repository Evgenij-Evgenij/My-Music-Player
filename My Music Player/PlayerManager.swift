//
//  PlayerManager.swift
//  Music Player
//
//  Created by Евгений Воронов on 16.07.2022.
//

import Foundation
import AVKit


final class PlayerManager: ObservableObject {
    static let shared = PlayerManager()
    
    
    private var player: AVPlayer?
    
    @Published var currentSong: Album.Song?
    @Published var currentAlbum: Album?
    
    var isPlayingNow = false
    
    func play(song: Album.Song) {
        guard let url = Bundle.main.path(forResource: song.fileName, ofType: "mp3") else {
            print("## invalid url")
            return
        }
        
        if currentSong == song {
            player?.play()
        } else {
            player = AVPlayer(url: URL(fileURLWithPath: url))
            player?.play()
            currentSong = song
        }
    }
    
    func pause() {
        player?.pause()
    }
    func nextSong() {}
    func previousSong() {}
    
    
}
