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
    var   data:Date?
    var   previsaoProxima:Date?
    var   flAplicada:Bool?
    var   estabelecimento:Usuario?
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="flAplicada" {
            self.flAplicada = value as? Bool
            
        }else if key=="tpVacina"{
            self.tpVacina = EnumUtil.getInListEnum(EnumVacina.self, value)
            
        }else if key == "data"{
            self.data = DateUtil.formatResponseJson(dateString: value )
            
        }else if key == "previsaoProxima" {
            self.previsaoProxima = DateUtil.formatResponseJson(dateString: value )
        
        }else{
            super.setValue(value, forKey: key)
        
        }
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        return[
            "id":(self.id  as AnyObject),
            "animal":(self.animal?.toJSON()  as AnyObject),
            "tpVacina":self.tpVacina!.rawValue  as AnyObject,
            "data":DateUtil.dateFormatToJson(date:self.data) as AnyObject,
            "previsaoProxima":DateUtil.dateFormatToJson(date:self.previsaoProxima) as AnyObject,
            "flAplicada":(self.flAplicada  as AnyObject),
            "estabelecimento":(self.estabelecimento  as AnyObject)
            
        ]
    }
    
    
}
