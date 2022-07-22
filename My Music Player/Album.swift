//
//  Album.swift
//  FullMusicPlayerApp
//
//  Created by Евгений Воронов on 29.06.2022.
//

import SwiftUI

struct Album: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var image: String
    var songs: [Song]
    
    
    struct Song: Hashable {
        var name : String
        var image: String
        var artist: String
        var fileName: String
    }
}


extension Album {
    static func get() -> [Album] {
        return [
            Album(name: "Cinematic", image: "cinematic", songs: [
//                Album.Song(name: "Тримай мене міцно", image: "cinematic", artist: "Hristina Soloviy", fileName: "hristina_solovij_-_trimaj_mene_micno_(z2.fm)"),
                Album.Song(name: "Хто як не ти", image: "cinematic", artist: "Hristina Soloviy", fileName: "hristina_solovij_-_trimaj_mene_micno_(z2.fm)")
            ]),
            Album(name: "Rock", image: "rock", songs: [
                Album.Song(name: "Bones", image: "rock", artist: "Image Dragons", fileName: "hiti_2022_-_imagine_dragons_-_bones_(z2.fm)"),
                Album.Song(name: "Старі фотографії", image: "rock", artist: "Kuzma Skryabin", fileName: "kuzma_i_gruppa_skrjabin_kuzma_i_gurt_skrjabin_-_starie_fotografii_stari_fotografi_(z2.fm)"),
                Album.Song(name: "Кораблі", image: "rock", artist: "Kuzma Skryabin", fileName: "kuzma_skrjabin_-_ljudi__jak_korabli_(z2.fm)"),
                Album.Song(name: "Не твоя війна", image: "rock", artist: "Okean Elzi", fileName: "okean_elzi__svjatoslav_vakarchuk_-_ne_tvoja_vijna_(z2.fm)"),
                Album.Song(name: "All the right moves", image: "rock", artist: "One republic", fileName: "one_republic_-_all_the_right_moves_(z2.fm)"),
                Album.Song(name: "Біля тополі", image: "rock", artist: "Shumei", fileName: "shumei_-_bilja_topoli_(z2.fm)"),
                Album.Song(name: "Apologize", image: "rock", artist: "One republic", fileName: "timbaland_-_apologise_feat_one_republic_(z2.fm)")
                    ]),
            Album(name: "Hip Hop", image: "hiphop", songs: [
                Album.Song(name: "Плакала", image: "hiphop", artist: "Lesha Svik", fileName: "lesha_svik_-_plakala_(z2.fm)"),
                Album.Song(name: "Буде весна", image: "hiphop", artist: "Maks Barskih", fileName: "maks_barskih_-_bude_vesna_(z2.fm)"),
                Album.Song(name: "Занесло", image: "hiphop", artist: "Loboda", fileName: "muzika_v_mashinu_2022_-_loboda_-_zaneslo_silver_ace__dj_witzin_radio_edit_(z2.fm)"),
                Album.Song(name: "Доброго вечора", image: "hiphop", artist: "Hardi Danim", fileName: "probass__hardi__danim_feat_tricky_nicki_-_dobroho_vechora__my_z_ukrayiny_-_dobrogo_vechora__mi_z_ukrani_(z2.fm)")
            ])
            
        ]
    }
}
