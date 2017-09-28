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
    var   dataInicio:Date?
    var   dataTermino:Date?
    var   hrTratamento:Date?
   
    
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="frequencia"{
            self.frequencia = EnumUtil.getInListEnum(EnumFrequenciaTratamento.self, value)
            
        }else if key=="dataInicio"{
            self.dataInicio = DateUtil.formatResponseJson(dateString: value )
            
        }else if key=="dataTermino"{
            self.dataTermino =  DateUtil.formatResponseJson(dateString: value )
            
        }else if key=="hrTratamento"{
            self.hrTratamento = DateUtil.hourDescToDate(hour:value as! String ,seconds:true )
            
        }else{
            super.setValue(value, forKey: key)
        }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
       
        return[
            "id":(self.id  as AnyObject),
            "animal":(self.animal?.toJSON()  as AnyObject),
           "frequencia":self.frequencia!.rawValue as AnyObject,
            "nm_tratamento":(self.nm_tratamento  as AnyObject),
            "dataInicio":DateUtil.dateFormatToJson(date:self.dataInicio) as AnyObject,
            "dataTermino":DateUtil.dateFormatToJson(date:self.dataTermino) as AnyObject,
            "hrTratamento":DateUtil.hourFormatToJson(date:self.hrTratamento) as AnyObject
           
            
        ]
    }
    
    
}
