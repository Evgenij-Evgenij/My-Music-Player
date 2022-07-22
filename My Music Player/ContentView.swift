//
//  ContentView.swift
//  Music Player
//
//  Created by Евгений Воронов on 16.07.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            AlbomListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
