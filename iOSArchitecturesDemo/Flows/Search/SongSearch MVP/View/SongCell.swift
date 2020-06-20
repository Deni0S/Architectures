//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 19.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
   
    // MARK: - Subviews
    
    private(set) lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var trackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var pictureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.artistLabel.text = cellModel.artist
        self.trackLabel.text = cellModel.track
        self.pictureLabel.text = cellModel.picture
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.artistLabel, self.trackLabel, self.pictureLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addArtistLabel()
        self.addTrackLabel()
        self.addPictureLabel()
    }
    
    private func addArtistLabel() {
        self.contentView.addSubview(self.artistLabel)
        NSLayoutConstraint.activate([
            self.artistLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.artistLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.artistLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addTrackLabel() {
        self.contentView.addSubview(self.trackLabel)
        NSLayoutConstraint.activate([
            self.trackLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 4.0),
            self.trackLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.trackLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addPictureLabel() {
        self.contentView.addSubview(self.pictureLabel)
        NSLayoutConstraint.activate([
            self.pictureLabel.topAnchor.constraint(equalTo: self.trackLabel.bottomAnchor, constant: 4.0),
            self.pictureLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.pictureLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
}
