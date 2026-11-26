//
//  ViewController.swift
//  App3
//
//  Created by Turno Mananas on 23/11/2026.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var table: UITableView!
    var games_1: [Game] = []
    var games_2: [Game] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        let search = UISearchController()
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        Task {
            games_1 = await Api.getGames()
            games_2 = games_1
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games_2.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Game", for: indexPath) as! GameTableViewCell
        let game = games_2[indexPath.row]
        cell.render(game: game)
        return cell
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        games_2 = games_1
        table.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text = searchText
        if text.isEmpty {
            games_2 = games_1
        } else {
            games_2 = games_1.filter {
                $0.title.lowercased().contains(text.lowercased())
            }
        }
        table.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view_controller = segue.destination as! GameViewController
        let index = table.indexPathForSelectedRow!
        view_controller.game = games_2[index.row]
        table.deselectRow(at: index, animated: false)
    }
}
