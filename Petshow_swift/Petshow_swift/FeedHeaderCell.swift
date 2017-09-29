//
//  FeedHeaderCell.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class FeedHeaderCell: UITableViewCell {
    
    @IBOutlet var imageHeader: UIImageView!
    
    @IBOutlet var lblNamePost: UILabel!

    @IBOutlet var lblTimePost: UILabel!
    
    @IBOutlet var lblAnimais: UILabel!
    
    var postagem: Postagem! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        imageHeader.image = ImageUtil.nsString64ToImage(stringImage:(postagem.usuario?.foto)! )
        imageHeader.layer.cornerRadius = imageHeader.bounds.width / 2.0
        imageHeader.layer.masksToBounds = true
        
        lblNamePost.text = postagem.usuario?.nome?.description
        
        
        
    }

}
