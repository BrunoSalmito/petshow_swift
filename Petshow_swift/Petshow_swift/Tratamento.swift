//
//  Tratamento.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Tratamento:Entidade{
    
    var   animal:Animal?
    var   frequencia:EnumFrequenciaTratamento?
    var   nm_tratamento:NSString?
    var   dataInicio:NSDate?
    var   dataTermino:NSDate?
    var   hrTratamento:NSDate?
   
    
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="frequencia"{
            for f in EnumUtil.iterateEnum(EnumFrequenciaTratamento) {
                
                if String(describing: f.self)==value as? String{
                    
                    frequencia=f;
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
            "frequencia":self.frequencia!.rawValue as AnyObject,
            "nm_Tratamento":(self.nm_tratamento  as AnyObject),
            "dataInicio":(self.dataInicio  as AnyObject),
            "dataTermino":(self.dataTermino  as AnyObject),
            "hrTratamento":(self.hrTratamento  as AnyObject),
           
            
        ]
    }
    
    
}
