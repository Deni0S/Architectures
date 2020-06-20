//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 20.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailView: UIView {
    
    // MARK: - Subviews
    
    let imageView = UIImageView()
    let throbber = UIActivityIndicatorView(style: .gray)
    let artistLabel = UILabel()
    let trackLabel = UILabel()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addImageView()
        self.addImageViewThrobber()
        self.addData()
        self.setupConstraints()
    }
    
    private func addImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        self.imageView.layer.cornerRadius = 10.0
        self.imageView.layer.masksToBounds = true
        self.addSubview(self.imageView)
    }
    
    private func addImageViewThrobber() {
        self.throbber.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.addSubview(self.throbber)
    }
    
    private func addData() {
        self.artistLabel.translatesAutoresizingMaskIntoConstraints = false
        self.artistLabel.font = UIFont.systemFont(ofSize: 23)
        self.artistLabel.numberOfLines = 3
        self.artistLabel.layer.masksToBounds = true
        self.addSubview(self.artistLabel)
        self.trackLabel.translatesAutoresizingMaskIntoConstraints = false
        self.trackLabel.font = UIFont.systemFont(ofSize: 21)
        self.trackLabel.layer.masksToBounds = true
        self.addSubview(self.trackLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.widthAnchor.constraint(equalToConstant: 100.0),
            self.imageView.heightAnchor.constraint(equalToConstant: 100.0),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            self.artistLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.artistLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 30),
            self.artistLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.trackLabel.topAnchor.constraint(equalTo: self.artistLabel.bottomAnchor, constant: 20),
            self.trackLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 30),
            
            
            self.throbber.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.throbber.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
}
