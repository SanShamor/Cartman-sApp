//
//  ViewController.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class CharactersListViewController: UIViewController {
    
    @IBOutlet weak var characterTableView: UITableView!
    
    private var peopleFromSouthPark: People?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterTableView.dataSource = self
        characterTableView.delegate = self
        fetchData(from: URLS.southParkAPI.rawValue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = characterTableView.indexPathForSelectedRow else { return }
        let person = peopleFromSouthPark?.data[indexPath.row]
        let detailCharacterVC = segue.destination as! DetailCharacterViewController
        detailCharacterVC.character = person
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { spPeople in
            self.peopleFromSouthPark = spPeople
            self.characterTableView.reloadData()
        }
    }
    
}

extension CharactersListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peopleFromSouthPark?.data.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterTableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
        let boy = peopleFromSouthPark?.data[indexPath.row]
        cell.configure(with: boy)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
