//
//  Racas.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 05/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation


class Racas:Entidade{
    
    var   descricao:NSString?
    var   tipoAnimal:EnumTipoAnimal?
    
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
            "id":(self.id  as AnyObject),
            "descricao":(self.descricao  as AnyObject),
            "tipoAnimal":self.tipoAnimal!.rawValue as AnyObject
        ]
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        
        if key=="tipoAnimal"{
            for f in iterateEnum(EnumTipoAnimal) {
                
                if String(describing: f.self)==value as? String{
                    
                    tipoAnimal=f;
                }
            }
        }else{
            
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    
}
