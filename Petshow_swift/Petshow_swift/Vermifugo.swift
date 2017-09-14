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
    var   dtVermifugoDose1:NSDate?
    var   reforco:Bool?
    var   dtVermifugoDoseReforco:NSDate?
    var   dtVermifugoDose1Ant:NSDate?
    var   dtVermifugoDoseReforcoAnt:NSDate?
    var   frequencia:EnumFrequenciaVermifugacao?
    var   isTomou1:Bool?
    var   isTomouReforco:Bool?
   
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key=="flAplicada" || key=="isTomou1" || key=="isTomouReforco"{
            
            if(key=="reforco"){
                self.reforco = value as? Bool
            }
            if(key=="isTomou1"){
                self.isTomou1 = value as? Bool
            }
            if(key=="isTomouReforco"){
                self.isTomouReforco = value as? Bool
            }
            
            
        }else if key=="frequencia"{
            for f in iterateEnum(EnumFrequenciaVermifugacao) {
                
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
            "dtVermifugoDose1":(self.dtVermifugoDose1  as AnyObject),
            "dtVermifugoDose1Ant":(self.dtVermifugoDose1Ant  as AnyObject),
            "dtVermifugoDoseReforcoAnt":(self.dtVermifugoDoseReforcoAnt  as AnyObject),
            "isTomou1":(self.isTomou1  as AnyObject),
            "reforco":(self.reforco  as AnyObject),
            "isTomouReforco":(self.isTomouReforco  as AnyObject)
        
            
        ]
    }
    
    
}
