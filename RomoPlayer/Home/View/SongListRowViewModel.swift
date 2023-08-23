//
//  SongListRowViewModel.swift
//  RomoPlayer
//
//  Created by rouzbeh on 23.08.23.
//

import Foundation
import SwiftUI
class SongListRowViewModel: ObservableObject {
    private var imageDataTask: URLSessionDataTask?
    @Published var image = Image("")
    func loadImageFromURL(_ imageUrlString: String)  {
        var image = Image("")
        guard let imageUrl = URL(string: imageUrlString) else {
            return
        }
        imageDataTask?.cancel()
        imageDataTask = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async { [weak self] in
                    self?.image = Image(uiImage: uiImage)
                }
            }
        }
      
        imageDataTask?.resume()
    }
}
