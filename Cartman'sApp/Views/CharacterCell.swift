//
//  CharacterCell.swift
//  Cartman'sApp
//
//  Created by Александр on 07.12.2021.
//

import UIKit

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterSexLabel: UILabel!
    @IBOutlet weak var characterReligionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func configure(with character: Character?) {
        characterNameLabel.text = character?.name ?? "Nothing"
        characterSexLabel.text = character?.sex ?? "Nothing"
        characterReligionLabel.text = character?.religion ?? "Nothing"
    }

}
