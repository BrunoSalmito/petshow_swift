//
//  FeedCell.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 29/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet var imageFeed: UIImageView!
    
    @IBOutlet var lblCurtidas: UIButton!
  
    @IBOutlet var lblComentarios: UILabel!
    
    
    @IBOutlet var lblDescPost: UILabel!
    
    @IBOutlet var imageCurtir: UIImageView!
    
    @IBOutlet var imageComents: UIImageView!
    
    @IBOutlet var compartilhar: UIImageView!
    
    
    var postagem: Postagem! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
        
        self.imageFeed.image = ImageUtil.nsString64ToImage(stringImage: postagem.foto!)
        self.lblDescPost.text = postagem.descPostagem?.description
//        postCaptionLabel.text = post.caption
//        numberOfLikesButton.setTitle("Be the first one to share a comment", for: [])
//        timeAgoLabel.text = post.timeAgo
    }

    
    
}
