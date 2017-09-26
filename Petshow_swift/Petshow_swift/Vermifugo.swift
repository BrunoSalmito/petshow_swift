//
//  Vermifugo.swift
//  Petshow_swift
//
//  Created by Bruno Salmito on 14/09/17.
//  Copyright © 2017 Bruno Salmito. All rights reserved.
//

import Foundation

class Vermifugo:Entidade{
    
    var   animal:Animal?
    var   dtVermifugoDose1:Date?
    var   reforco:Bool?
    var   dtVermifugoDoseReforco:Date?
    var   dtVermifugoDose1Ant:Date?
    var   dtVermifugoDoseReforcoAnt:Date?
    var   frequencia:EnumFrequenciaVermifugacao?
    var   isTomou1:Bool?
    var   isTomouReforco:Bool?
   
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        
            if(key == "reforco"){
                
                self.reforco = value as? Bool
                
            }else if(key == "tomou1"){
                
                self.isTomou1 = value as? Bool
                
            }else if(key == "tomouReforco"){
                
                self.isTomouReforco = value as? Bool
                
            }  else if key == "frequencia"{
                
                self.frequencia = EnumUtil.getInListEnum(EnumFrequenciaVermifugacao.self, value)
                
            } else if key == "dtVermifugoDose1"{
                
                self.dtVermifugoDose1 = DateUtil.formatResponseJson(dateString: value )
                
            } else if key == "dtVermifugoDoseReforco"{
                
                self.dtVermifugoDoseReforco = DateUtil.formatResponseJson(dateString: value )
                
            } else if key == "dtVermifugoDose1Ant"{
                
                self.dtVermifugoDose1Ant = DateUtil.formatResponseJson(dateString: value )
                
            } else if key == "dtVermifugoDoseReforcoAnt"{
                
                self.dtVermifugoDoseReforcoAnt = DateUtil.formatResponseJson(dateString: value )
                
            }else{
                  super.setValue(value, forKey: key)
            }
        
        
        
    }
    
    override func toJSON() -> Dictionary<String, AnyObject> {
        
        
       
        return[
            
            "id":(self.id  as AnyObject),
            "animal":(self.animal?.toJSON()  as AnyObject),
            "frequencia":self.frequencia!.rawValue as AnyObject,
            "dtVermifugoDose1":DateUtil.dateFormatToJson(date:self.dtVermifugoDose1) as AnyObject,
            "dtVermifugoDoseReforco":DateUtil.dateFormatToJson(date:self.dtVermifugoDoseReforco) as AnyObject,
            "dtVermifugoDose1Ant":DateUtil.dateFormatToJson(date:self.dtVermifugoDose1Ant) as AnyObject,
            "dtVermifugoDoseReforcoAnt":DateUtil.dateFormatToJson(date:self.dtVermifugoDoseReforcoAnt) as AnyObject,
            "reforco":(self.reforco?.description  as AnyObject),
            "tomou1":(self.isTomou1?.description  as AnyObject),
            "tomouReforco":(self.isTomouReforco?.description as AnyObject),
        
            
        ]
    }
    
  
    
}

