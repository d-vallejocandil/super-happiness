//
//  GameViewController.swift
//  App3
//
//  Created by Turno Mananas on 26/11/2026.
//

import UIKit

class GameViewController: UIViewController {
    var game: Game!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var genre_platform: UILabel!
    @IBOutlet weak var description_label: UILabel!
    @IBOutlet weak var publisher_developer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = game.title
        self.navigationItem.subtitle = String(game.id)
        Task {
            game = await Api.getGame(id: game.id)
            DispatchQueue.main.async {
                self.load()
            }
        }
    }
    func load() {
        thumbnail.load(url: game.thumbnail)
        genre_platform.text = "\(game.genre) | \(game.platform)"
        description_label.text = game.description
        publisher_developer.text = game.publisher + " | \(game.developer)"
    }
}
