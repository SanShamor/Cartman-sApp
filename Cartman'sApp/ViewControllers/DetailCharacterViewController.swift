//
//  DetailCharacter.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class DetailCharacterViewController: UIViewController {
    
    @IBOutlet weak var discriptionPersonLabel: UILabel!
    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var savingButton: UIButton!
    
    var character: PersonSouthPark!
    var dataStoreManager = DataStoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discriptionPersonLabel.text = character.description
        checkOutLabel.text = ""
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let user = dataStoreManager.savePerson(person: character)
        checkOutLabel.backgroundColor = .green
        checkOutLabel.text = "\(user.name!) was saved!"
        savingButton.isHidden = true
    }
    
}
