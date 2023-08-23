//
//  SongListRow.swift
//  RomoPlayer
//
//  Created by rouzbeh on 22.08.23.
//

import UIKit
import SwiftUI


class SongListRow: UITableViewCell, CellData {
    var data: CellDataConformable?
    private var imageDataTask: URLSessionDataTask?
    
    
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    var musicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 1.0
        imageView.layer.cornerRadius = 40 // Half of width and height
        return imageView
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont .systemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        containerStackView.addConstraintsToEdges(of: contentView, insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        containerStackView.layer.cornerRadius = 10
        
        containerStackView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        containerStackView.backgroundColor = .black
        let view = UIView()
        containerStackView.addArrangedSubview(view)
        view.widthAnchor.constraint(equalToConstant: 8).isActive = true
        
        containerStackView.addArrangedSubview(musicImageView)
        musicImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        musicImageView.heightAnchor.constraint(equalTo: musicImageView.widthAnchor).isActive = true
        
        containerStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(artistLabel)
    }
    
    func loadImageFromURL(_ imageUrlString: String)  {
        guard let imageUrl = URL(string: imageUrlString) else {
            return
        }
        imageDataTask?.cancel()
        imageDataTask = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async { [weak self] in
                    self?.musicImageView.image = uiImage
                }
            }
        }
        imageDataTask?.resume()
    }
    
    func configure(with data: CellDataConformable) {
        guard let songData = data as? SongItem else {
            return
        }
        loadImageFromURL(songData.artistImage)
        
        nameLabel.text = songData.title
        artistLabel.text = songData.artistName
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

