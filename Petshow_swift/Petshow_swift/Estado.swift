//
//  Estado.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 05/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation


class Estado:Entidade{

    var   codigo:NSInteger?
    var   nome:NSString?
    var   sigla:NSString?
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "codigo":(self.codigo  as AnyObject),
            "nome":(self.nome  as AnyObject),
            "sigla":(self.sigla  as AnyObject)
        ]
    }
    
}


