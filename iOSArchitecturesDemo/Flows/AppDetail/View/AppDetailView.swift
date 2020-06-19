//
//  AppDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

final class AppDetailView: UIView {
    
    // MARK: - Subviews
    
    let imageView = UIImageView()
    let throbber = UIActivityIndicatorView(style: .gray)
    let versionLabel = UILabel()
    let titleLabel = UILabel()
    let dateVersionLabel = UILabel()
    let appDescription = UITextView()
    
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
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.font = UIFont.systemFont(ofSize: 23)
        self.titleLabel.numberOfLines = 3
        self.titleLabel.layer.masksToBounds = true
        self.addSubview(self.titleLabel)
        self.versionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.versionLabel.font = UIFont.systemFont(ofSize: 21)
        self.versionLabel.layer.masksToBounds = true
        self.addSubview(self.versionLabel)
        self.dateVersionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dateVersionLabel.font = UIFont.systemFont(ofSize: 21)
        self.dateVersionLabel.layer.masksToBounds = true
        self.addSubview(self.dateVersionLabel)
        self.appDescription.translatesAutoresizingMaskIntoConstraints = false
        self.appDescription.font = UIFont.systemFont(ofSize: 19)
        self.appDescription.layer.masksToBounds = true
        self.addSubview(self.appDescription)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.widthAnchor.constraint(equalToConstant: 100.0),
            self.imageView.heightAnchor.constraint(equalToConstant: 100.0),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 30),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 20),
            self.versionLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 30),
            
            self.dateVersionLabel.centerYAnchor.constraint(equalTo: self.versionLabel.centerYAnchor),
            self.dateVersionLabel.leadingAnchor.constraint(equalTo: self.versionLabel.trailingAnchor, constant: 10),
            
            self.appDescription.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 20),
            self.appDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.appDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.appDescription.heightAnchor.constraint(equalToConstant: 300.0),
            
            self.throbber.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.throbber.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
}
