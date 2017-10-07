//
//  CellAnimalPost.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 07/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class CellAnimalPost: UITableViewCell {

    @IBOutlet var lblNomeAnimal: UILabel!
    @IBOutlet var swichMarcado: UISwitch!
    @IBOutlet var imageAnimal: UIImageView!
    
    var animal:Animal!  {
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI (){
        imageAnimal.image = ImageUtil.nsString64ToImage(stringImage: animal.fotoPerfil!)
        lblNomeAnimal.text = animal.nome?.description
        swichMarcado.setOn(false, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        swichMarcado.setOn(false, animated: false)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
