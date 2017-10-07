//
//  CellComment.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 02/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class CellComment: UITableViewCell {
    
    @IBOutlet var imageUsuario: UIImageView!
  
    
    @IBOutlet var labelComentario: LabelPadding!

    @IBOutlet var lblTime: UILabel!
    
    var comment: Comentario! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        self.sizeToFit()
        self.imageUsuario.image = ImageUtil.nsString64ToImage(stringImage: (comment.usuario?.foto)!)
        self.labelComentario.text = comment.descricao?.description
        //labelComentario.sizeToFit()
        self.imageUsuario.layer.cornerRadius = imageUsuario.bounds.width / 2.0
        self.imageUsuario.layer.masksToBounds = true
        
        var boldText  = (comment.usuario?.nome?.description)!
        var attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 13)]
        var attributedString = NSMutableAttributedString(string:boldText, attributes:attrs)
        
        var normalText = "\n" + (comment.descricao?.description)! + "\n"
        var attrsNormalText = [NSFontAttributeName : UIFont.systemFont(ofSize: 14)]
        var normalString = NSMutableAttributedString(string:normalText, attributes:attrsNormalText)

        attributedString.append(normalString)
        self.labelComentario.attributedText = attributedString
        self.labelComentario.layer.cornerRadius = 7
        self.labelComentario.layer.masksToBounds = true
        
    }
    
}
