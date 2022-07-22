//
//  HomeView.swift
//  My Music Player
//
//  Created by Kostiantyn Nevinchanyi on 7/23/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                // alboms
                ForEach(viewModel.albums, id: \.id) { album in
                    NavigationLink {
                        TrackListView(album: album)
                    } label: {
                        AlbumView(album: album)
                    }
                }
                
                Spacer()
                // Tab bar
                
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
        .overlay(
            VStack {
                Spacer()
                
                // TODO: Slider and current time and total time
                
                HStack {
                    Button {
                        viewModel.playOrPause()
                    } label: {
                        Image(systemName: viewModel.playButton)
                            .font(.title)
                            .padding()
                            .foregroundColor(.black)
                    }
                    
                    LazyVStack(alignment: .leading) {
                        Text(viewModel.currentSongName)
                        Text(viewModel.currentSongArtist)
                    }
                }
                .background(Color.green.opacity(0.1))
            }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AlbumView: View {
    let album: Album
    var body: some View {
        HStack {
            Image(album.image)
                .resizable()
                .cornerRadius(20)
                .frame(width: 50, height: 50)
            
            LazyVStack(alignment: .leading) {
                Text(album.name)
                    .font(.title2.bold())
                
                Text("\(album.songs.count) songs")
            }
            
            Image(systemName: "chevron.right")
        }
        .foregroundColor(.black)
    }
}





final class HomeViewModel: ObservableObject {
    @Published var albums: [Album] = Album.get()
//    @Published var showMusicPanel = false
    private let playerManager = PlayerManager.shared
    
    @Published var currentSong: Album.Song?
    @Published var isPlayingNow = false
    
    
    
    
    init() {
        playerManager.delegate = self
    }
    
    func playOrPause() {
        playerManager.playOrPause()
    }
}

extension HomeViewModel: PlayerManagerDelegate {
    func player(didChangeCurrent song: Album.Song) {
        currentSong = song
    }
    func player(isPlayingNow: Bool) {
        self.isPlayingNow = isPlayingNow
    }
}

// MARK: UI
extension HomeViewModel {
    var playButton: String {
        isPlayingNow ? "pause.fill" : "play.fill"
    }
    var currentSongName: String {
        currentSong?.name ?? "N/A"
    }
    var currentSongArtist: String {
        currentSong?.artist ?? "N/A"
    }
}
