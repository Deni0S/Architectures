//
//  SongDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Денис Баринов on 19.6.20.
//  Copyright © 2020 ekireev. All rights reserved.
//

import UIKit

final class SongDetailViewController: UIViewController {
    public var song: ITunesSong?
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = SongDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationController()
        self.downloadImage()
        self.setData()
    }
    
    // MARK: - Private
    
    private func configureNavigationController() {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func downloadImage() {
        guard let url = self.song?.artwork else { return }
        self.appDetailView.throbber.startAnimating()
        self.imageDownloader.getImage(fromUrl: url) { (image, error) in
            self.appDetailView.throbber.stopAnimating()
            guard let image = image else { return }
            self.appDetailView.imageView.image = image
        }
    }
    
    private func setData() {
        if let artist = self.song?.artistName {
            self.appDetailView.artistLabel.text = String("\(artist)")
        }
        if let track = self.song?.trackName {
            self.appDetailView.trackLabel.text = String("\(track)")
        }
    }
}
