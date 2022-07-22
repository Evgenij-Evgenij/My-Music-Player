//
//  TrackListView.swift
//  FullMusicPlayerApp
//
//  Created by Евгений Воронов on 29.06.2022.
//

import SwiftUI

struct AlbomListView: View {
    let albums = Album.get()
    
    var body: some View {
        VStack {
            Button {
                //
            } label: {
                HStack {
                    Text("Play All")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    
                    Image("play (64)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width * 0.07, height: UIScreen.main.bounds.height * 0.07)
                }
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.red))
                
            }
            
            List(albums, id: \.id) { album in
                NavigationLink {
                    TrackListView(album: album)
                } label: {
                    HStack {
                        Image(album.image)
                            .resizable()
                        //.scaledToFit()
                            .cornerRadius(20)
                            .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.12)
                        VStack(alignment: .leading) {
                            Text(album.name)
                                .font(.title2.bold())
                            
                            Text("\(album.songs.count) songs")
                            
                        }
                    }
                }
            }
        }.navigationTitle("My Music Player")
    }
}

struct AlbomListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AlbomListView()
            }
        }
    }
}


