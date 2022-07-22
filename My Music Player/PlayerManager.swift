//
//  PlayerManager.swift
//  Music Player
//
//  Created by Евгений Воронов on 16.07.2022.
//

import Foundation
import AVKit


protocol PlayerManagerDelegate: AnyObject {
    func player(didChangeCurrent song: Album.Song)
    func player(isPlayingNow: Bool)
    
    // TODO: change current time slider value
//    func player()
}


final class PlayerManager: ObservableObject {
    static let shared = PlayerManager()
    
    weak var delegate: PlayerManagerDelegate?
    
    private var player: AVPlayer?
    
    var currentSong: Album.Song?
    var currentAlbum: Album?
    
    var isPlayingNow = false
    
    
    // TODO: Google how to track progress of song playing
    // Total time = 05 min 10 sec
    // Current value = 3 min 1 sec
    
    
    // TODO: Google how to manage volume level
    // Start volume 0.5 / 1.0
    // Slider to change the current volume
    
    
    
}


// MARK: Music playing controls
extension PlayerManager {
    
    func playOrPause() {
        if isPlayingNow {
            pause()
        } else {
            play()
        }
    }
    
    func play() {
        guard let player = player else { return }
        player.play()
        isPlayingNow = true
        delegate?.player(isPlayingNow: true)
    }
    
    func choose(song: Album.Song) {
        guard let url = Bundle.main.path(forResource: song.fileName, ofType: "mp3") else {
            print("## invalid url")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: url))
        currentSong = song
        play()
        delegate?.player(didChangeCurrent: song)
    }
    
    func pause() {
        guard let player = player else { return }
        player.pause()
        isPlayingNow = false
        delegate?.player(isPlayingNow: false)
    }
    func nextSong() {}
    func previousSong() {}
    
}
