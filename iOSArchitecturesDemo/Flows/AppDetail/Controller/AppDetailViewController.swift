//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp?
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
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
        guard let url = self.app?.iconUrl else { return }
        self.appDetailView.throbber.startAnimating()
        self.imageDownloader.getImage(fromUrl: url) { (image, error) in
            self.appDetailView.throbber.stopAnimating()
            guard let image = image else { return }
            self.appDetailView.imageView.image = image
        }
    }
    
    private func setData() {
        if let version = self.app?.averageRating {
            self.appDetailView.versionLabel.text = String("Версия: \(version)")
        }
        if let name = self.app?.appName {
            self.appDetailView.titleLabel.text = String("\(name)")
        }
        if let dateString = self.app?.releaseDate {
            if let date = Date.appReleaseDate(for: dateString, with: "yyyy-MM-dd'T'HH:mm:ss'Z'") {
                self.appDetailView.dateVersionLabel.text = String("от \(date)")
            }
        }
        if let description = self.app?.appDescription {
            self.appDetailView.appDescription.text = String("\(description)")
        }
    }
}
