//
//  DetailCharacter.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class DetailCharacter: UIViewController {

    @IBOutlet weak var discriptionPersonLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discriptionPersonLabel.text = character.description
    }


}
