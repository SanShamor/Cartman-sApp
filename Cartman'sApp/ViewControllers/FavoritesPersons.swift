//
//  FavoritesPersons.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class FavoritesPersons: UITableViewController {
    
    private let boys = ["Catrman", "Stan", "Kyle", "Kenny"]
    private var savedPersons: [CorePerson] = []

    var dataStoreManager = DataStoreManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
        print("\(savedPersons.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        savedPersons = dataStoreManager.updateMainUser()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedPersons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let boy = savedPersons[indexPath.row].name
        var content = cell.defaultContentConfiguration()
        
        content.text = boy
        cell.contentConfiguration = content
        
        return cell
    }
}
