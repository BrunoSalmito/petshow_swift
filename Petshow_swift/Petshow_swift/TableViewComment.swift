//
//  TableViewComment.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 02/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import UIKit

class TableViewComment: UITableView , UITableViewDataSource {

    var comentarios:[Comentario]?  {
        didSet {
           self.reloadData()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.dataSource = self
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(comentarios?.count != nil){
            return comentarios!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cellComment", for: indexPath) as! CellComment
        
        var comentario:Comentario = comentarios![indexPath.row]
        cell.comment = comentario
        
        
        //cell.imageUsuario.image = ImageUtil.nsString64ToImage(stringImage: (comentarios?[indexPath.row].usuario?.foto)!)
        //cell.labelComentario.text = comentario.descricao?.description
        
        return cell
    }
    
    
   
    
    



}
