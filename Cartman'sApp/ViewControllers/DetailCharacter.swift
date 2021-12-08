//
//  DetailCharacter.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class DetailCharacter: UIViewController {

    @IBOutlet weak var discriptionPersonLabel: UILabel!
    @IBOutlet weak var checkOutLabel: UILabel!
    
    var character: CharacterPerson!
    var dataStoreManager = DataStoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discriptionPersonLabel.text = character.description
    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        let user = dataStoreManager.obtainMainUser(character: character)
        checkOutLabel.text = user.name
    }
    
    
}
