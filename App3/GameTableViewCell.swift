//
//  GameTableViewCell.swift
//  App3
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var card: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func render(game: Game) {
        title.text = game.title
        thumbnail.load(url: game.thumbnail)
    }
}
