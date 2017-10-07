//
//  Comentario.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 02/10/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//


import Foundation

class Comentario:Entidade{
    
    var usuario:Usuario?
    var descricao:NSString?
    var dataInclusao:Date?
    

    override func setValue(_ value: Any?, forKey key: String) {
        if key=="dataInclusao" {
            self.dataInclusao = DateUtil.formatResponseJson(dateString: value )
           
        }else{
            super.setValue(value, forKey: key)
            
        }
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "descricao":(self.descricao  as AnyObject),
            "dataInclusao":DateUtil.dateFormatToJson(date:self.dataInclusao) as AnyObject,
            "usuario":usuario?.toJSON() as AnyObject
        ]
    }
}
