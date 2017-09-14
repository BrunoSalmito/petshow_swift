//
//  Vacina.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Vacina:Entidade{

    var   animal:Animal?
    var   tpVacina:EnumVacina?
    var   data:NSDate?
    var   previsaoProxima:NSDate?
    var   flAplicada:Bool?
    var   estabelecimento:Usuario?
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="flAplicada" {
            self.flAplicada = value as? Bool
            
        }else if key=="tpVacina"{
                for f in iterateEnum(EnumVacina) {
                    
                    if String(describing: f.self)==value as? String{
                        
                        tpVacina=f;
                    }
                }
        }else{
            
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        return[
           "id":(self.id  as AnyObject),
           "animal":(self.animal  as AnyObject),
           "tpVacina":self.tpVacina!.rawValue as AnyObject,
           "data":(self.data  as AnyObject),
           "previsaoProxima":(self.previsaoProxima  as AnyObject),
           "flAplicada":(self.flAplicada  as AnyObject),
           "estabelecimento":(self.estabelecimento  as AnyObject)
            
        ]
    }
    

}
