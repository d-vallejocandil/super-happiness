//
//  ViewController.swift
//  App3
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var games: [Game] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        Task {
            games = await Api.getGames()
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game", for: indexPath) as! GameTableViewCell
        let game = games[indexPath.row]
        cell.render(game: game)
        return cell
    }
}
