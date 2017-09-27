//
//  CellAnimalListaController.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 26/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class CellAnimalListaController: UITableViewCell {

    @IBOutlet var lblPrincipal: UILabel!
    @IBOutlet var imageAnimal: UIImageView!
    @IBOutlet var lblDetalhe: UILabel!
    
    @IBOutlet var imageWarning: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
