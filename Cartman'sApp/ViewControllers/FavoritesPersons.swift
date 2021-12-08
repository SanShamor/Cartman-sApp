//
//  FavoritesPersons.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class FavoritesPersons: UITableViewController {
    
    private var favoritesPersons: [CorePerson] = []
    private var dataStoreManager = DataStoreManager()
    
    override func viewWillAppear(_ animated: Bool) {
        favoritesPersons = dataStoreManager.getPersons()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesPersons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let personName = favoritesPersons[indexPath.row].name ?? ""
        let personAge = favoritesPersons[indexPath.row].age
        var content = cell.defaultContentConfiguration()
         
        content.text = personName + " " + String(personAge)
        cell.contentConfiguration = content
        return cell
    }
}
