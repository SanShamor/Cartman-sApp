//
//  FavoritesPersons.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class FavoritesPersons: UITableViewController {
    
    private let boys = ["Catrman", "Stan", "Kyle", "Kenny"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        boys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as! CharacterCell
        let boy = boys[indexPath.row]
        
        cell.characterNameLabel.text = boy
        return cell
    }
}
