//
//  ViewController.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class CharactersList: UIViewController {
    
    @IBOutlet weak var characterTableView: UITableView!
    
    private var boys = ["Kyle", "Cartman", "Stan", "Kenny"]
    private var southParkPerson: SPPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterTableView.dataSource = self
        characterTableView.delegate = self
        fetchData(from: URLS.southParkAPI.rawValue)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = characterTableView.indexPathForSelectedRow else { return }
        let person = southParkPerson?.data[indexPath.row]
        let detailCharacterVC = segue.destination as! DetailCharacter
        detailCharacterVC.character = person
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { spPerson in
            self.southParkPerson = spPerson
            self.characterTableView.reloadData()
        }
    }
    
}

extension CharactersList: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        southParkPerson?.data.count ?? boys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = characterTableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
        let boy = southParkPerson?.data[indexPath.row]
        //cell.characterNameLabel.text = boy
        //cell.characterImageView.image = ""
        cell.configure(with: boy)
        
        return cell
    }
    
    
}
