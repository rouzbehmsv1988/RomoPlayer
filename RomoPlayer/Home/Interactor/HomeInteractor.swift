//
//  HomeInteractor.swift
//  RomoPlayer
//
//  Created by rouzbeh on 21.08.23.
//

import Foundation
import MusicKit
class HomeInteractor: HomeInteractorInputProtocol {
    weak var presenter: HomePresenterProtocol?

    func fetchItems() {
        // Fetch data and then notify the presenter
        authorizeMusic()
    }
    private var songs: [SongItem] = []
    private let request: MusicCatalogSearchRequest = {
        var request = MusicCatalogSearchRequest(term: "Hello", types: [Song.self])
        request.limit = 25
        return request
    }()
    func authorizeMusic() {
        Task {
            let status = await MusicAuthorization.request()
            switch status {
            case .authorized:
                do {
                    let result = try await request.response()
                    songs = result.songs.compactMap({ song in
                        return SongItem(artistImage: song.artwork?.url(width: 50, height: 50)?.absoluteString ?? "", title: song.title, artistName: song.artistName)
                    })
                    presenter?.itemsFetched(songs)
                } catch {
                    
                }
            default:
                break
            }
        }
    }
}

