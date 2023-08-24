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

    func fetchItems(_ text: String?) {
        // Fetch data and then notify the presenter
        guard let searchText = text else { return }
        authorizeMusic(searchText)
    }
    private var songs: [SongItem] = []

    func authorizeMusic(_ text: String) {
        Task {
            var request = MusicCatalogSearchRequest(term: text, types: [Song.self])
            request.limit = 25
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

