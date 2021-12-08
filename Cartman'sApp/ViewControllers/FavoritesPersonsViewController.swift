//
//  FavoritesPersons.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class FavoritesPersonsViewController: UITableViewController {
    
    private var favoritesPersons: [CorePerson] = []
    private var dataStoreManager = DataStoreManager()
    
    override func viewWillAppear(_ animated: Bool) {
        favoritesPersons = dataStoreManager.getPersons()
        tableView.reloadData()
    }
}

// MARK: - Table view data source
extension FavoritesPersonsViewController {
    
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

// MARK: - UITableViewDelegate
extension FavoritesPersonsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let person = favoritesPersons[indexPath.row]
        
        if editingStyle == .delete {
            favoritesPersons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            dataStoreManager.delete(person)
        }
    }
    
}
